function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local counter = player:getStorageValue(2405)
    
	
	if target.itemid == 2761 then
    local exp = math.random(60, 270)
    player:addExperience(exp, true)
    --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience cutting orchids.")
    
    -- 1% chance to get a colored rose
    local chance = math.random(1, 100)
    if chance <= 1 then
        local roses = {2744, 2745, 2746}
        local rose = roses[math.random(1, 3)]
        local exp = math.random(1, 1000)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience for finding rose.")
        player:addItem(rose, 1)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You found a colored rose!")
    end
    
    target:remove()
    return true
end

	
	--blueberry bush
	if target.itemid == 2785 then
        local exp = math.random(1,10)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        target:transform(2786)
        player:addItem(2677, math.random(1,9))
        target:getPosition():sendMagicEffect(13)
        target:decay()

        -- increment the counter and check if it reached 100
        counter = counter + 1
        player:setStorageValue(2405, counter)
        if counter % 100 == 0 then
            local expReward = math.random(50, 500)
            player:addExperience(expReward)
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, string.format("Congratulations! You've gathered and earned %d experience points.", expReward))
			player:getPosition():sendMagicEffect(28)
            player:setStorageValue(2405, 0) -- reset the counter
        end

        return true
    end
    
    return false
end
