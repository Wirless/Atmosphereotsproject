local drunk = Condition(CONDITION_DRUNK)
drunk:setParameter(CONDITION_PARAM_TICKS, 3600000)

local poison = Condition(CONDITION_POISON)
poison:setParameter(CONDITION_PARAM_DELAYED, true)
poison:setParameter(CONDITION_PARAM_MINVALUE, -50)
poison:setParameter(CONDITION_PARAM_MAXVALUE, -120)
poison:setParameter(CONDITION_PARAM_STARTVALUE, -5)
poison:setParameter(CONDITION_PARAM_TICKINTERVAL, 4000)
poison:setParameter(CONDITION_PARAM_FORCEUPDATE, true)

local fluidMessage = {
	[FLUID_BEER] = "Aah...",
	[FLUID_SLIME] = "Urgh!",
	[FLUID_LEMONADE] = "Mmmh.",
	[FLUID_MANA] = "Aaaah...",
	[FLUID_LIFE] = "Aaaah...",
	[FLUID_OIL] = "Urgh!",
	[FLUID_URINE] = "Urgh!",
	[FLUID_WINE] = "Aah...",
	[FLUID_MUD] = "Urgh!",
	[FLUID_RUM] = "Aah...",
	[FLUID_MEAD] = "Aaaah..."
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetItemType = ItemType(target.itemid)
	--local alcoholCount = player:getStorageValue(5565511) -- assuming storage id 5565511 is unused

	if targetItemType and targetItemType:isFluidContainer() then
		if target.type == FLUID_NONE and item.type ~= FLUID_NONE then
			target:transform(target:getId(), item.type)
			item:transform(item:getId(), FLUID_NONE)
			return true
		elseif target.type ~= FLUID_NONE and item.type == FLUID_NONE then
			item:transform(item:getId(), target.type)
			target:transform(target:getId(), FLUID_NONE)
			return true
		end
	end

	if target.itemid == 1 then
		if item.type == FLUID_NONE then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "It is empty.")
		elseif target.uid == player.uid then
			if table.contains({FLUID_BEER, FLUID_WINE, FLUID_MEAD}, item.type) then
				--if alcoholCount <= 0 then
				--	player:setStorageValue(5565511,1)
				--end
				--alcoholCount = alcoholCount + 1
				--player:setStorageValue(5565511,alcoholCount)
				--if alcoholCount % 10000 == 0 then
				--	player:setStorageValue(55656, player:getStorageValue(55656) + 1)
				--	player:setStorageValue(5565611, 0)
				--end
				player:addCondition(drunk)

				--edit this script here so that every time player drinks the alcohol it counts and every 1000 it will increment playyers storage id 55656 by 1
			elseif item.type == FLUID_SLIME then
				player:addCondition(poison)
			elseif item.type == FLUID_MANA then
				player:addMana(math.random(50, 150))
				fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			elseif item.type == FLUID_LIFE then
				player:addHealth(60)
				fromPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
			player:say(fluidMessage[item.type] or "Gulp.", TALKTYPE_MONSTER_SAY)
			item:transform(item:getId(), FLUID_NONE)
		else
			Game.createItem(2016, item.type, toPosition):decay()
			item:transform(item:getId(), FLUID_NONE)
		end
	else
		local fluidSource = targetItemType and targetItemType:getFluidSource() or FLUID_NONE
		if fluidSource ~= FLUID_NONE then
			item:transform(item:getId(), fluidSource)
		elseif item.type == FLUID_NONE then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "It is empty.")
		else
			if toPosition.x == CONTAINER_POSITION then
				toPosition = player:getPosition()
			end
			Game.createItem(2016, item.type, toPosition):decay()
			item:transform(item:getId(), FLUID_NONE)
		end
	end
	return true
end
