function onSay(player, words, param)
    if not player:isPlayer() then
        return false
    end

    local storageId = tostring(param)

    if not storageId or storageId == "" or string.len(storageId) > 30 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Invalid storage id.")
        return false
    end

    local keyItem = player:addItem(2087, 1)
    if not keyItem then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Failed to create the Wooden Key.")
        return false
    end

    keyItem:setAttribute(ITEM_ATTRIBUTE_TEXT, storageId)
    keyItem:setActionId(storageId)

    player:sendTextMessage(MESSAGE_INFO_DESCR, "Wooden Key with storage id '"..storageId.."' created.")

    return false
end

-- Register the talkaction with the keyword "/createkey"
function onRegister()
    registerCreatureEvent(getCreatureName(), "talkaction")
    registerAnonymousEventHandler("talkaction", "onSay", {"/createkey"})
end
