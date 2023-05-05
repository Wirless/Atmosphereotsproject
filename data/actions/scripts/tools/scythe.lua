function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if target.itemid == 2739 then
        target:transform(2737)
        target:decay()
        player:addItem(2694, math.random(1,3))
        local exp = math.random(15, 50)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        player:getPosition():sendMagicEffect(4)

        -- Add a unique storage to keep track of successful uses of the item
        local USES_STORAGE = 2550
        local uses = player:getStorageValue(USES_STORAGE) + 1
        player:setStorageValue(USES_STORAGE, uses)

        -- Check if the player has used the item 100 times, and reward them with random exp if true
        if uses % 10000 == 0 then
            local reward = math.random(100, 100000)
			player:setStorageValue(55656, player:getStorageValue(55656) + 1)
            player:addExperience(reward,true)
            --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. reward .. " experience from successful gathering!")
            player:setStorageValue(USES_STORAGE, 0)
			player:getPosition():sendMagicEffect(28)
        end

        return true
    end
    return destroyItem(player, target, toPosition)
end
