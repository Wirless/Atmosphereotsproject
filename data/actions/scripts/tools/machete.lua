local SUCCESSFUL_USES_STORAGE = 2420 -- Change to any unused value

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if target.itemid == 2782 then
        target:transform(2781)
        target:decay()
        return true
    end

    if target.itemid == 2905 then
        target:transform(2907)
        target:decay()
        player:addItem(2666, math.random(1, 5))
		player:addItem(3976, math.random(1, 3))
        local exp = math.random(20,80)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        target:getPosition():sendMagicEffect(1)
    elseif target.itemid == 3119 then
        target:transform(3120)
        target:decay()
        player:addItem(2666, math.random(1, 5))
		player:addItem(3976, math.random(1, 3))
       local exp = math.random(20,80)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        target:getPosition():sendMagicEffect(1)
		
	elseif target.itemid == 2849 then
        target:transform(2850)
        target:decay()
		player:addItem(2671, math.random(3, 8))
        player:addItem(2666, math.random(3, 10))
		player:addItem(3976, math.random(5, 20))
       local exp = math.random(20,80)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        target:getPosition():sendMagicEffect(1)
	elseif target.itemid == 2826 then
        target:transform(2828)
        target:decay()
		player:addItem(2671, math.random(3, 3))
        player:addItem(2666, math.random(3, 7))
		player:addItem(3976, math.random(5, 15))
       local exp = math.random(20,80)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        target:getPosition():sendMagicEffect(1)
		
	elseif target.itemid == 2969 then
        target:transform(2970)
        target:decay()
		player:addItem(2671, math.random(5, 20))
        player:addItem(2666, math.random(5, 30))
		player:addItem(3976, math.random(5, 100))
       local exp = math.random(20,80)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        target:getPosition():sendMagicEffect(1)
    elseif target.itemid == 2935 then
        target:transform(2937)
        target:decay()
        player:addItem(2666, math.random(1, 7))
		player:addItem(3976, math.random(1, 3))
        local exp = math.random(20,80)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        target:getPosition():sendMagicEffect(1)
    elseif target.itemid == 4265 then
        target:transform(4266)
        target:decay()
        player:addItem(2666, math.random(1, 2))
		player:addItem(3976, math.random(1, 3))
        local exp = math.random(20,80)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        target:getPosition():sendMagicEffect(1)
    elseif target.itemid == 2826 then
        target:transform(2828)
        target:decay()
        player:addItem(2666, math.random(1, 4))
		player:addItem(3976, math.random(1, 3))
        local exp = math.random(20,80)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        target:getPosition():sendMagicEffect(1)
   elseif target.itemid == 2956 then
        target:transform(2957)
        target:decay()
        if math.random(10) == 1 then -- 1 in 10 chance to get vampire soul
            player:addItem(6560, 1)
            local exp = math.random(1, 3000)
            player:addExperience(exp, true)
            --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering, and found a vampire soul!")
        else
            local exp = math.random(1, 150)
            player:addExperience(exp, true)
            --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        end
        target:getPosition():sendMagicEffect(1)
	
	else
        return destroyItem(player, target, toPosition)
    end
    
    -- Increment successful uses and check if reset is needed
    local successfulUses = player:getStorageValue(SUCCESSFUL_USES_STORAGE) + 1
    player:setStorageValue(SUCCESSFUL_USES_STORAGE, successfulUses)
    if successfulUses % 10000 == 0 then
        -- Award random experience between 100 and 1000
		player:setStorageValue(55656, player:getStorageValue(55656) + 1)
        local exp = math.random(1, 25000)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from successful gathering!")
        player:setStorageValue(SUCCESSFUL_USES_STORAGE, 0) -- Reset successful uses
		player:getPosition():sendMagicEffect(28)
    end
    
    return true
end
