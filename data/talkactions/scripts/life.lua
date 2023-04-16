function onSay(player, words, param)

    local storageValue = player:getStorageValue(1444444)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "You have been online for "  .. storageValue .. ".")
    return false
end
