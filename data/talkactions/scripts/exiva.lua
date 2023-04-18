function onSay(player, words, param)
    local storageType = words:sub(2) -- Extracts "friend" or "war" from the command
    local action, name = param:match("(%a+)%s?(%a*)") -- Extracts the action (add or remove) and the name
    
    if action == "add" and name ~= "" then
        local names = player:getStorageValue(storageType)
        if type(names) ~= "table" then
            names = {}
        end
        table.insert(names, name)
        player:setStorageValue(storageType, names)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, name .. " has been added to your " .. storageType .. " list.")
    elseif action == "remove" and name ~= "" then
        local names = player:getStorageValue(storageType)
        if type(names) == "table" then
            for i, v in ipairs(names) do
                if v == name then
                    table.remove(names, i)
                    player:setStorageValue(storageType, names)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, name .. " has been removed from your " .. storageType .. " list.")
                    return false
                end
            end
        end
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, name .. " was not found in your " .. storageType .. " list.")
    elseif action == "configure" then
        local configBook = player:addItem(1970, 1) -- Book of Exiva Configuration (item ID 1970)
        configBook:setActionId(50000) -- Set the action ID to a unique value
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Please open the Book of Exiva Configuration to edit your " .. storageType .. " list.")
    else
        -- No valid action was provided, show the help message
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Usage: /find " .. storageType .. " add name OR /find " .. storageType .. " remove name OR /find " .. storageType .. " configure")
    end
    return false
end
