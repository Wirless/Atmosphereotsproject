--angelstatues

local temple1 = Position(1008, 1002, 7)
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item.actionid == 1365 then -- check if item action ID matches
        player:teleportTo(Position(979, 969, 7))
        return true
    elseif item.actionid == 1366 then -- check if item action ID matches
        player:teleportTo(temple1)
        return true
	elseif item.actionid == 2646 then -- check if item action ID matches
        player:teleportTo(Position(1014, 908, 7))
        return true
	elseif item.actionid == 2647 then -- check if item action ID matches
        player:teleportTo(temple1)
        return true
	elseif item.actionid == 2648 then -- check if item action ID matches
        player:teleportTo(Position(940, 906 ,7))
        return true
	elseif item.actionid == 2649 then -- check if item action ID matches
        player:teleportTo(temple1)
        return true
	elseif item.actionid == 2651 then
		player:teleportTo(temple1)
		return true
	elseif item.actionid == 2650 then -- check if item action ID matches
        player:teleportTo(Position(1332, 855 ,7))
        return true
    end
    return false
end
