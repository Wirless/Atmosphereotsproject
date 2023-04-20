function onSay(player, words, param)
    local window = ModalWindow {
        title = "Set Storage",
        message = "Select an option to set storage 6969",
        buttons = {
            { caption = "Set to -1", callback = "callbackSetStorage", params = { storageValue = -1 } },
            { caption = "Set to 1", callback = "callbackSetStorage", params = { storageValue = 1 } },
            { caption = "Cancel", callback = "callbackCancel" }
        }
    }
    window:addButton("Cancel", "cancel")
    window:setDefaultEscapeButton("Cancel")
    window:sendToPlayer(player)
    return false
end

function callbackSetStorage(player, params)
    local storageValue = params.storageValue
    player:setStorageValue(6969, storageValue)
    player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Storage 6969 has been set to %d.", storageValue))
end

function callbackCancel(player)
    player:sendCancelMessage("Action cancelled.")
end
