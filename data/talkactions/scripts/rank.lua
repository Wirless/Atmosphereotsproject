if not playerRanking then
	playerRanking = {
		-- Time in seconds a rank request stays in cache before a new one is made
		cacheDuration = 60, 
		-- How many players to show in each page
		pageSize      = 25,
		 -- How many promotions there are in your server (e.g knight->elite knight->super op knight = 2 promotions) 
		promotions    = 1, 

		ranks = { 
			[SKILL_FIST]     = {},
			[SKILL_SWORD]    = {},
			[SKILL_CLUB] 	 = {},
			[SKILL_SWORD]    = {},
			[SKILL_AXE] 	 = {},
			[SKILL_DISTANCE] = {},
			[SKILL_SHIELD]   = {},
			[SKILL_FISHING]  = {},
			[SKILL_MAGLEVEL] = {},
			[SKILL_LEVEL]    = {}
		}
	}
end

local function filter(list, predicate)
	local ret = {}
	for k, v in ipairs(list) do
		if predicate(v) then
			table.insert(ret, v)
		end
	end
	return ret
end

local function map(list, predicate)
	local ret = {}
	for k, v in ipairs(list) do
		table.insert(ret, predicate(v))
	end
	return ret
end

local function bind(func, ...)
	local bindings = {...}
	return function(...)
		local args, passArgs = {...}, { }
		for _, bindedArg in pairs(bindings) do
			local placeholder = (type(bindedArg) == 'string') and bindedArg:match('^placeholder_(%d-)$')
			if placeholder then
				passArgs[_] = args[tonumber(placeholder)]
			else
				passArgs[_] = bindedArg
			end
		end
		return func(unpack(passArgs))
	end
end

function table.getindex(list, value, isArray)
	local iterator = isArray and ipairs or pairs
	for k, v in iterator(list) do
		if v == value then
			return k
		end
	end
	return false
end
table.contains = table.getindex

function string.split(str, sep)
	local ret = {}
	str:gsub('([^' .. sep .. ']+)', function(p) table.insert(ret, p) end)
	return ret
end

function string.capitalize(str)
	return str:sub(1, 1):upper() .. str:sub(2)
end

local skillKeywords = {
	[SKILL_FIST]     = 'fist',
	[SKILL_CLUB]     = 'club',
	[SKILL_SWORD]    = 'sword',
	[SKILL_AXE]      = 'axe',
	[SKILL_DISTANCE] = {'distance', 'dist'},
	[SKILL_SHIELD]   = 'shield',
	[SKILL_FISHING]  = 'fishing',
	[SKILL_MAGLEVEL] = {'magiclevel', 'ml', 'magic', 'maglevel'},
	[SKILL_LEVEL]    = {'level', 'lvl'}
}
local function getSkillByKeyword(keyword)
	for skill = SKILL_FIST, SKILL_LEVEL do
		local tmp = skillKeywords[skill]
		if type(tmp) == 'string' then
			if tmp == keyword then
				return skill
			end
		elseif table.contains(tmp, keyword, true) then
			return skill
		end
	end
end

local function getSkillName(skill)
	if skill == SKILL_SHIELD then
		return 'Shielding'
	elseif skill == SKILL_MAGLEVEL then
		return 'Magic Level'
	elseif skill == SKILL_FISHING then
		return 'Fishing'
	elseif skill == SKILL_LEVEL then
		return 'Level'
	elseif skill == SKILL_DISTANCE then
		return 'Distance Fighting'
	elseif skill == SKILL_FIST then
		return 'Fist Fighting'
	else
		return skillKeywords[skill][1]:capitalize() .. ' Fighting'
	end
end

local function getPlayerSkill(player, skill)
	if skill == SKILL_LEVEL then
		return player:getLevel()
	elseif skill == SKILL_MAGLEVEL then
		return player:getBaseMagicLevel()
	end
	return player:getSkillLevel(skill)
end

local queryFormat = 'SELECT `name`, `%s`, `vocation` FROM `players` WHERE `group_id` <= 1 %s ORDER BY `%s` DESC LIMIT %d,%d;'
local vocationFilterFormat = 'AND `vocation` IN (%s)'
local skillColumns = {
	[SKILL_FIST]     = 'skill_fist',
	[SKILL_CLUB]     = 'skill_club',
	[SKILL_SWORD]    = 'skill_sword',
	[SKILL_AXE]      = 'skill_axe',
	[SKILL_DISTANCE] = 'skill_dist',
	[SKILL_SHIELD]   = 'skill_shielding',
	[SKILL_FISHING]  = 'skill_fishing',
	[SKILL_MAGLEVEL] = 'maglevel',
	[SKILL_LEVEL]    = 'level'	
}
local function getRequestQuery(skill, vocationFilter, from, to)
	local skillName = skillColumns[skill]
	return queryFormat:format(
		skillName, 
		#vocationFilter == 0 and '' or vocationFilterFormat:format(table.concat(vocationFilter)),
		skillName,
		from, to - from
	)
end

-- each list entry is {name = X, skill = Y, vocation = Z}
local function updateRanking(skill, list)
	for _, entry in ipairs(list) do
		local current = filter(playerRanking.ranks[skill], function(e) return e.name == entry.name end)[1]
		if current then
			current.skill = math.max(entry.skill, current.skill)
		else
			table.insert(playerRanking.ranks[skill], entry)
		end
	end
end

local function sortRanking(skill)
	table.sort(playerRanking.ranks[skill], 
		function(a, b)
			return a.skill > b.skill
		end
	)
end

local function checkVocation(entry, vocationFilter)
	return #vocationFilter == 0 or table.contains(vocationFilter, entry.vocation)
end

function Vocation.getBase(self)
	local id = self:getId()
	while id > 4 do
		id = id - 4
	end
	return Vocation(id)
end

local function transformPlayer(player, skill)
	return {name = player:getName(), vocation = player:getVocation():getBase():getId(), skill = getPlayerSkill(player, skill)}
end

local function retrieveRanking(skill, vocationFilter, from, to, callback)
	db.asyncStoreQuery(getRequestQuery(skill, vocationFilter, from, to),
		function(query)
			local list = {}
			if query then
				repeat
					local entry ={
						name = result.getDataString(query, 'name'),
						vocation = result.getDataInt(query, 'vocation'),
						skill = result.getDataInt(query, skillColumns[skill])
					}
					table.insert(list, entry)
				until not result.next(query)
			end

			local onlinePlayers = filter(
			                            map(
			                                Game.getPlayers(),
			                                bind(transformPlayer, 'placeholder_1', skill)
			                            ),

			                            bind(checkVocation, 'placeholder_1', vocationFilter)
			                      )

			updateRanking(skill, list)
			updateRanking(skill, onlinePlayers)
			sortRanking(skill)

			if callback then
				return callback()
			end
		end
	)
end

local vocations = {'sorcerer', 'druid', 'paladin', 'knight'}

local function showRanking(player, skill, vocationFilter, page, skipCheck)
	local rank = playerRanking.ranks[skill]
	rank.expiration = rank.expiration or 0
	local currentTime = os.time()
	local pageSize = playerRanking.pageSize

	-- No cached results or cache is too old
	if (#rank == 0 and currentTime < rank.expiration) or (currentTime >= rank.expiration) then
		local rank = { }
		rank.expiration = currentTime + playerRanking.cacheDuration
		playerRanking.ranks[skill] = rank
		return retrieveRanking(skill, vocationFilter, page * pageSize, (page + 1) * pageSize, bind(showRanking, player, skill, vocationFilter, page, true))
	end

	-- Filter ranking by specified vocation
	local ranking = filter(rank, bind(checkVocation, 'placeholder_1', vocationFilter))

	-- Cached results aren't enough to fill one page, try to retrieve more
	if not skipCheck and (#ranking - page * pageSize) < pageSize then
		return retrieveRanking(skill, vocationFilter, #ranking, #ranking + pageSize, bind(showRanking, player, skill, vocationFilter, page, true))
	end

	-- Construct result window
	local message
	if #vocationFilter > 0 then
		local filter = {}
		for _, vocId in ipairs(vocationFilter) do
			local vocName = vocations[vocId]
			if vocName then
				table.insert(filter, vocName)
			end
		end

		message = 'Filter: ' .. table.concat(filter, ', ')
	end

	local rankWindow = ModalWindow {
		title = 'Rank: ' .. getSkillName(skill) .. ' Page ' .. (page + 1),
		message = message
	}

	local previousButton = rankWindow:addButton((page == 0) and '-' or 'Previous')
	if page > 0 then
		previousButton.callback = bind(showRanking, player, skill, vocationFilter, page - 1, true)
	end

	local okButton = rankWindow:addButton('Ok')
	rankWindow:setDefaultEnterButton('Ok')
	rankWindow:setDefaultEscapeButton('Ok')

	local hasNext = (#ranking - page * 25) > pageSize
	local nextButton = rankWindow:addButton(hasNext and 'Next' or '-')
	if type(nextButton) ~= 'table' then
		print('Error: addButton failed to create button object')
		return
	end
	if hasNext then
		nextButton.callback = bind(showRanking, player, skill, vocationFilter, page + 1, false)
	end

	if #ranking < page * pageSize + 1 then
		rankWindow:addChoice('This ranking is empty.')
	else
		for n = page * pageSize + 1, (page + 1) * pageSize do
			local entry = ranking[n]			
			if entry then
				rankWindow:addChoice(string.format('%.2d - %s [%d]', n, entry.name, entry.skill))
			end
		end
	end

	rankWindow:sendToPlayer(player)
end

function onSay(player, words, param)
	local p = param:split(',%s')

	if p[1] == 'help' then
		local helpWindow = ModalWindow {
			title = '!rank help',
			message = 'Usage: !rank skill filter\n\nSkills: fist, club, sword, axe, distance\nshielding, fishing, magiclevel, level\n\n' ..
					  'Filters: sorcerer, druid, paladin, knight\n\n' ..
					  'Select one of the examples and click [Try]'
		}

		-- Add usage example
		local example1 = helpWindow:addChoice('!rank level')
		example1.skill = SKILL_LEVEL
		example1.vocationFilter = {}
		local example2 = helpWindow:addChoice('!rank magiclevel paladin')
		example2.skill = SKILL_MAGLEVEL
		example2.vocationFilter = {3, 7}
		local example3 = helpWindow:addChoice('!rank fist knight paladin')
		example3.skill = SKILL_FIST
		example3.vocationFilter = {3, 4, 8, 8}

		local tryButton = helpWindow:addButton('Try',
			function(button, choice)
				return showRanking(player, choice.skill, choice.vocationFilter, 0)
			end
		)
		helpWindow:addButton('Close')

		helpWindow:setDefaultEnterButton('Try')

		helpWindow:sendToPlayer(player)
		return false
	end

	local skill = getSkillByKeyword(p[1])
	if not p[1] then
		skill = SKILL_LEVEL
	end

	if not skill then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Command usage is wrong. Try !rank help for more information.')
		return false
	end

	local vocationFilter = { }
	if #p > 1 then
		for i = 2, #p do
			local vocationId = table.getindex(vocations, p[i], true)
			if vocationId then
				for mul = 0, playerRanking.promotions do
					table.insert(vocationFilter, vocationId + mul * 4)
				end
			end
		end
	end

	showRanking(player, skill, vocationFilter, 0)
	return false
end