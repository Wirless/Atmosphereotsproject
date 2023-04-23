local rare_popup = true
local rare_text = "*rare*"
local rare_effect = true
local rare_effect_id = CONST_ME_MAGIC_GREEN

local tiers = {
	[1] = {
		prefix = 'rare',
		showattr = true, -- attr prefix will be shown instead
		extra = {0, 0},
		chance = {
			[1] = 10000, -- chance for basic stat
			[2] = 5000 -- chance for second stat
		}
	},

	[2] = {
		prefix = 'epic',
		extra = {7, 20}, -- additional percent bonus
		chance = {
			[1] = 3333,
			[2] = 25000
		}
	},

	[3] = {
		prefix = 'legendary',
		extra = {20, 35},
		chance = {
			[1] = 1000,
			[2] = 100000 -- 2 bonuses always
		}
	},
}

--! attributes
local attr = {
	atk = {
		name = 'atk',
		prefix = 'sharpened',
		percent = {7, 25},
	},
	def = {
		name = 'def',
		prefix = 'fortified',
		percent = {7, 25},
	},
	extradef = {
		name = 'extra def',
		prefix = 'balanced',
		percent = {7, 25},
	},
	arm = {
		name = 'arm',
		prefix = 'flawless',
		percent = {7, 20},
	},
	hitchance = {
		name = 'accuracy',
		prefix = 'accurate',
		percent = {10, 25},
	},
	shootrange = {
		name = 'range',
		prefix = 'powerful',
		percent = {17, 34},
	},
	charges = {
		name = 'charges',
		prefix = 'charged',
		percent = {30, 45},
	},
	duration = {
		name = 'time',
		prefix = 'unique',
		percent = {35, 50},
	},

	--[[ not available in 1.1
	attackSpeed = {},
	extraAttack = {},
	]]
}

local stats = {
	[1] = {ITEM_ATTRIBUTE_ATTACK, attr.atk},
	[2] = {ITEM_ATTRIBUTE_DEFENSE, attr.def},
	[3] = {ITEM_ATTRIBUTE_EXTRADEFENSE, attr.extradef},
	[4] = {ITEM_ATTRIBUTE_ARMOR, attr.arm},
	[5] = {ITEM_ATTRIBUTE_HITCHANCE, attr.hitchance},
	[6] = {ITEM_ATTRIBUTE_SHOOTRANGE, attr.shootrange},
	[7] = {ITEM_ATTRIBUTE_CHARGES, attr.charges},
	[8] = {ITEM_ATTRIBUTE_DURATION, attr.duration},
	-- not available in 1.1
	-- [9] = {ITEM_ATTRIBUTE_ATTACKSPEED, attr.attackSpeed},
	-- [10] = {ITEM_ATTRIBUTE_EXTRAATTACK, attr.extraAttack},
}

function stat_getItemDuration(item)
	local it_id = item:getId()
	local tid = ItemType(it_id):getTransformEquipId()
	if tid > 0 then
		item:transform(tid)
		local vx = item:getAttribute(ITEM_ATTRIBUTE_DURATION)
		item:transform(it_id)
		item:removeAttribute(ITEM_ATTRIBUTE_DURATION)
		return vx
	end
	return 0
end

function loot_attrToVal(item, attr)
	local id = ItemType(item:getId())
	local v = {
		[ITEM_ATTRIBUTE_ATTACK] = id:getAttack(),
		[ITEM_ATTRIBUTE_DEFENSE] = id:getDefense(),
		[ITEM_ATTRIBUTE_EXTRADEFENSE] = id:getExtraDefense(),
		[ITEM_ATTRIBUTE_ARMOR] = id:getArmor(),
		[ITEM_ATTRIBUTE_HITCHANCE] = id:getHitChance(),
		[ITEM_ATTRIBUTE_SHOOTRANGE] = id:getShootRange(),
		[ITEM_ATTRIBUTE_CHARGES] = id:getCharges(),
		[ITEM_ATTRIBUTE_DURATION] = stat_getItemDuration(item),

		-- not available in 1.1
		-- [ITEM_ATTRIBUTE_ATTACKSPEED] = item:getAttackSpeed(),
		-- [ITEM_ATTRIBUTE_EXTRAATTACK] = item:getExtraAttack(),
	}
	return v[attr]
end

function assign_loot_Stat(c)
	local rares = 0
	local h = c:getItemHoldingCount()
	if h > 0 then
		for i = 1, h do
			local available_stats = {}
			local it_u = c:getItem(i - 1)
			local it_id = ItemType(it_u:getId())
			if it_u:isContainer() then
				local crares = assign_loot_Stat(it_u)
				rares = rares + crares
			else
				if not it_id:isStackable() then
					local wp = it_id:getWeaponType()
					if wp > 0 then
						if wp == WEAPON_SHIELD then -- type shield
							table.insert(available_stats, stats[2])
						elseif wp == WEAPON_DISTANCE then -- type bow
							table.insert(available_stats, stats[1])
							table.insert(available_stats, stats[5])
							table.insert(available_stats, stats[6])
							-- not available in 1.1
							-- table.insert(available_stats, stats[9])
						elseif wp == WEAPON_WAND then -- type wand
							table.insert(available_stats, stats[6])
						-- not available in 1.1
						-- table.insert(available_stats, stats[9])
						elseif isInArray({WEAPON_SWORD, WEAPON_CLUB, WEAPON_AXE}, wp) then -- melee weapon

							if it_id:getAttack() > 0 then
								table.insert(available_stats, stats[1])
							end
							
							if it_id:getDefense() > 0 then
								table.insert(available_stats, stats[2])
							end
							
							if it_id:getExtraDefense() ~= 0 then
								table.insert(available_stats, stats[3])
							end
							-- not available in 1.1
							-- table.insert(available_stats, stats[10])
						end
					else -- armors, amulets, runes and rings
						if it_id:getArmor() > 0 then
							table.insert(available_stats, stats[4])
						end

						if it_id:getCharges() > 0 then
							table.insert(available_stats, stats[7])
						end

						local eq_id = it_id:getTransformEquipId()
						if eq_id > 0 then
							table.insert(available_stats, stats[8])
						end
					end
				end
			end

			if #available_stats > 0 then
				-- skips it all if it's empty
				local tier = math.random(1, #tiers)
				if #tiers[tier].chance > 0 then
					local statsStored = 0
					local stats_used = {}
					for stat = 1, #tiers[tier].chance do
						if #available_stats > 0 then
							-- stops if no more stats available
							if stat - 1 == statsStored then
								-- checks when it's time to stop adding stats
								if math.random(1, 100000) <= tiers[tier].chance[stat] then
									statsStored = statsStored + 1

									local selected_stat = math.random(1, #available_stats)
									table.insert(stats_used, available_stats[selected_stat])
									table.remove(available_stats, selected_stat)
								end
							end
						end
					end

					if #stats_used > 0 then
						rares = rares + 1
						local stat_desc = {}
						for stat = 1, #stats_used do
							local v = math.random(
								stats_used[stat][2].percent[1],
								stats_used[stat][2].percent[2]
							) + math.random(
								tiers[tier].extra[1],
								tiers[tier].extra[2]
							)
							local basestat = loot_attrToVal(it_u, stats_used[stat][1])
							it_u:setAttribute(stats_used[stat][1], basestat + math.abs(basestat * v / 100))
							table.insert(stat_desc, '[' .. stats_used[stat][2].name .. ': +' .. v .. '%]')
						end

						if tiers[tier].showattr then
							for stat = 1, #stats_used do
								it_u:setAttribute(ITEM_ATTRIBUTE_NAME, "[" .. stats_used[stat][2].prefix .. "]" .. it_u:getAttribute(ITEM_ATTRIBUTE_NAME))
							end
							it_u:setAttribute(ITEM_ATTRIBUTE_NAME, it_u:getAttribute(ITEM_ATTRIBUTE_NAME) .. " " .. it_id:getName())
						else
							it_u:setAttribute(ITEM_ATTRIBUTE_NAME, tiers[tier].prefix .. " " .. it_id:getName())
						end

						it_u:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, table.concat(stat_desc, "\n"))
					end
				end
			end
		end
	end
	return rares
end

function find_loot_Container(pos)
	local rares = 0
	local c = Tile(pos):getTopDownItem()
	if c ~= nil then
		if c:isContainer() then
			rares = rares + assign_loot_Stat(c)
			if rares > 0 then
				if rare_popup then
					local spectators = Game.getSpectators(pos, false, true, 7, 7, 5, 5)
					for i = 1, #spectators do
						spectators[i]:say(rare_text, TALKTYPE_MONSTER_SAY, false, spectators[i], pos)
					end
				end

				if rare_effect then
					pos:sendMagicEffect(rare_effect_id)
				end
			end
			return true
		end
	end
end

function onKill(player, target, lastHit)
	if (not isSummon(target)) then
		addEvent(find_loot_Container, 2, target:getPosition())
	end
	return true
end

function onLogin(player)
	player:registerEvent("randomstats_loot")
	return true
end