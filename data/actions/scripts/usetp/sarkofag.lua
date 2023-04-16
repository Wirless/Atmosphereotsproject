local UNIQUE_STORAGE_ID = 55656

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item.actionid == 14365 then -- check if item action ID matches
        if player:getStorageValue(UNIQUE_STORAGE_ID) <= 1 then -- check if unique storage value is less than 1
            player:addExperience(25) -- award 25 experience points
            player:setStorageValue(UNIQUE_STORAGE_ID, 2) -- set unique storage value to 1
        end
        player:teleportTo(Position(1011, 1005, 12))
        return true
    elseif item.actionid == 14112 then -- check if item action ID matches
        if player:getStorageValue(UNIQUE_STORAGE_ID) <= 1 then -- check if unique storage value is less than 1
            player:addExperience(25) -- award 25 experience points
            player:setStorageValue(UNIQUE_STORAGE_ID, 2) -- set unique storage value to 1
        end
        player:teleportTo(Position(1104, 1050, 7))
        return true
    end
    return false
end
