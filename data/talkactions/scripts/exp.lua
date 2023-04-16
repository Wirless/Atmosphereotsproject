function onSay(player, words, param)
    if not player:isPlayer() then
        return false
    end

    local storageId = 156001
    local currentValue = player:getStorageValue(storageId)
    
    if currentValue == 1 then
        player:setStorageValue(storageId, 0)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Experience gain is now on.")
    else
        player:setStorageValue(storageId, 1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Experience gain is now off.")
    end

    return false
end