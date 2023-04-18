local groundIds = {354, 355}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	local tile = Tile(toPosition)
	if not tile then
		return false
	end

	local ground = tile:getGround()
	if not ground then
		return false
	end

	if (ground.actionid == 3333) and table.contains(groundIds, ground.itemid) then
			ground:transform(392)
	ground:decay()
	toPosition.z = toPosition.z + 1
	tile:relocateTo(toPosition)
	end



	
	return true
end
