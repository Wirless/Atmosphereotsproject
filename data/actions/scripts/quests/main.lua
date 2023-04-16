function sendDelayedEffects(player)
	player:getPosition():sendMagicEffect(29)
	addEvent(function() player:getPosition():sendMagicEffect(30) player:say("I LOVE TO SHOVEL I LOVE TO SHOVEL", TALKTYPE_SAY) end, 1000)
	addEvent(function() player:getPosition():sendMagicEffect(28) player:say("I LOVE TO SHOVEL I LOVE TO SHOVEL", TALKTYPE_SAY) end, 2000)
end






function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local uniqueId = item:getUniqueId()

    if uniqueId == 9905 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 9905 -- Change this to the storage value required for the quest
        local rewardItems = {2476, 2477, 2462} -- The item IDs of the rewards for the black knight quest
        local totalWeight = 0

        -- Calculate the total weight of the reward items
        for i = 1, #rewardItems do
            local itemWeight = ItemType(rewardItems[i]):getWeight()
            totalWeight = totalWeight + itemWeight
        end

        -- Check if the player has the required storage value for the quest
        if player:getStorageValue(storageValue) == 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
        elseif player:getStorageValue(storageValue) < 1 then
         --   player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must complete the quest before claiming your rewards.")
      --  else
            -- Check if the player has enough capacity to carry the reward items
            if player:getFreeCapacity() >= totalWeight then
                -- Give reward for the black knight quest
                for i = 1, #rewardItems do
                    player:addItem(rewardItems[i], 1)
                end
                player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have completed the black knight quest and received your rewards!")
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already done this .")
            end
        end
	-- banshhee quest
	
	
	--boh
	elseif uniqueId == 25303 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 25303 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2195, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found giant sword!")
			--player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
		end
	-- 10k
	elseif uniqueId == 25302 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 25302 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2152, 100)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found platinum coins!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
		end
	
	elseif uniqueId == 8141 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 8141 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2393, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found giant sword!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
		end
		
	elseif uniqueId == 8142 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 8142 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2528, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found giant sword!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
		end
	
	elseif uniqueId == 8140 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 8140 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2165, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found stealth ring!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
		end
		
	elseif uniqueId == 8127 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 8127 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local bag = player:addItem(1993)
			bag:addItem(2162, 1) -- magiclightwand
			bag:addItem(2214, 1) -- roh
			bag:addItem(2193, 1) -- ankh

			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a red bag!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
		end
		
	elseif uniqueId == 8126 then
        local storageValue = 8126

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2152, 100)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found platinum coins!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
		end
		
		
	elseif uniqueId == 8139 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 8140 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2197, 5)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found stone skin amulet!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
		end
	
	-- black knight key
	
	
    elseif uniqueId == 8033 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 8033 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(2005) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have completed the black knight quest and received your rewards!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed the black knight quest and cannot receive more rewards.")
		end
      
	-- shovel quest
	
	
	elseif uniqueId == 19000 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 19000 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2554, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Try digging the ground outside temple with this!")
			sendDelayedEffects(player)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already got the shovel now go dig the ground in front of temple!")
		sendDelayedEffects(player)
		player:addItem(2554, 1)
		end
	
	
	elseif uniqueId == 8016 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 8016 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2488, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have completed the black knight quest and received your rewards!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed the black knight quest and cannot receive more rewards.")
		end
	
	
	elseif uniqueId == 8017 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 8017 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2487, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have completed the black knight quest and received your rewards!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed the black knight quest and cannot receive more rewards.")
		end
	
	
	
	elseif uniqueId == 2 then -- Check for unique ID 2 (other quest)
        local storageValue = 200 -- Change this to the storage value required for the quest
        local rewardItem = 200 -- Change this to the item ID of the reward for the quest

        -- Check if the player has the required storage value for the quest
        if player:getStorageValue(storageValue) == 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
        elseif player:getStorageValue(storageValue) < 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must complete the quest before claiming your reward.")
        else
            -- Check if the player has enough capacity to carry the reward item
            if player:getFreeCapacity() >= ItemType(rewardItem):getWeight() then
                -- Give reward for the quest
                player:addItem(rewardItem, 1)
                player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have completed Quest 2 and received your reward!")
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough capacity to carry the reward for Quest 2.")
            end
        end
		
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This quest is not scripted yet comeback soon..")
    end

    --item:remove(1) -- Remove the item from the player's inventory
    return true
end
