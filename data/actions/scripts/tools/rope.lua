local holeId = {
	294, 369, 370, 383, 392, 408, 409, 410, 427, 428, 429, 430, 462, 469, 470, 482,
	484, 485, 489, 924, 1369, 3135, 3136, 4835, 4837, 7933, 7938, 8170, 8249, 8250,
	8251, 8252, 8254, 8255, 8256, 8276, 8277, 8279, 8281, 8284, 8285, 8286, 8323,
	8567, 8585, 8595, 8596, 8972, 9606, 9625, 13190, 14461, 19519, 21536
}


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local exhaustStorage = 9999 -- change to desired exhaust storage value
	if player:getStorageValue(exhaustStorage) > os.time() then
		player:sendCancelMessage("You must wait a while before using this again.")
		return true
	end

	local tile = Tile(toPosition)
	if not tile then
		return false
	end

	if table.contains(ropeSpots, tile:getGround():getId()) or tile:getItemById(14435) then
		if Tile(toPosition:moveUpstairs()):hasFlag(TILESTATE_PROTECTIONZONE) and player:isPzLocked() then
			player:sendCancelMessage(RETURNVALUE_PLAYERISPZLOCKED)
			return true
		end
		player:teleportTo(toPosition, false)
		return true
	elseif table.contains(holeId, target.itemid) then
		toPosition.z = toPosition.z + 1
		tile = Tile(toPosition)
		if tile then
			local thing = tile:getTopVisibleThing()
			if thing:isPlayer() or thing:isCreature() or thing:isMonster() then
				if Tile(toPosition:moveUpstairs()):hasFlag(TILESTATE_PROTECTIONZONE) and thing:isPzLocked() then
					return false
				end
				player:setStorageValue(exhaustStorage, os.time() + 60) -- set exhaust storage value to current time plus 60 seconds
				player:setStorageValue(5565633, player:getStorageValue(5565633) + 1)
				return thing:teleportTo(toPosition, false)
			end
			if thing:isItem() and thing:getType():isMovable() then
				return thing:moveTo(toPosition:moveUpstairs())
			end
			
		
		end
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return true
	end
	return false
end