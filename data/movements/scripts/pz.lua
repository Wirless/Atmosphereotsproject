local PROTECTION_ZONE_STORAGE = 1000 -- Storage value to keep track of player's current zone
local PROTECTION_ZONE_FLAG = TILESTATE_PROTECTIONZONE -- Flag used to mark protection zones

function onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
	
	
	
	
    if player and player:isPlayer() then
        local currentZone = player:getStorageValue(PROTECTION_ZONE_STORAGE)
        local newZone = player:getTile():hasFlag(PROTECTION_ZONE_FLAG)
        if newZone and currentZone ~= 1 then
            -- Player has entered a protection zone
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You have entered the protection zone.")
            player:setStorageValue(PROTECTION_ZONE_STORAGE, 1)
			player:getPosition():sendMagicEffect(13)
        elseif not newZone and currentZone ~= 0 then
            -- Player has left a protection zone
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You have left the protection zone.")
            player:setStorageValue(PROTECTION_ZONE_STORAGE, 0)
			player:getPosition():sendMagicEffect(14)
        end
    end
end

function onStepOut(creature, item, position, fromPosition)
    -- We don't need to do anything in this function
end
