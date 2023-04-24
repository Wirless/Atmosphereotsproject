






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
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found boots of haste!")
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
	
	elseif uniqueId == 19100 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 19100 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2512, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a wooden shield!")
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
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found tower shield!")
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
        local storageValue = 8139 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2197, 5)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found stone skin amulet!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
		end


	-- gm isle key
	elseif uniqueId == 5316 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 5316 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(5316) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	-- gm isle key
	elseif uniqueId == 4242 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4242 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4242) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	-- gm isle key
	elseif uniqueId == 4243 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4243 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4243) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	
	--tomb
	
	elseif uniqueId == 4244 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4244 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4244) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		
	-- carlin
	elseif uniqueId == 4245 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4245 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4245) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	-- carlin
	elseif uniqueId == 4246 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4246 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4246) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	-- carlin
	elseif uniqueId == 4247 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4247 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4247) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	elseif uniqueId == 4248 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4248 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4248) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		--XD
	elseif uniqueId == 4240 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4240 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4240) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		--xd
	elseif uniqueId == 4241 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4241 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4241) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		--stil xding
	elseif uniqueId == 4252 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4252 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4252) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	--stil xding
	elseif uniqueId == 4251 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4251 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4251) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	--stil xding
	elseif uniqueId == 4253 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 4253 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4253) -- Set the action ID of the key item
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
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
			player:getPosition():sendMagicEffect(30)
			player:say("I LOVE TO SHOVEL I LOVE TO SHOVEL", TALKTYPE_SAY)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already got the shovel now go dig the ground in front of temple!")
		player:getPosition():sendMagicEffect(30)
		player:say("I LOVE TO SHOVEL I LOVE TO SHOVEL", TALKTYPE_SAY)
		player:addItem(2554, 1)
		end
	
	elseif uniqueId == 19002 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 19002 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2681, 4)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found grapes!")
			player:getPosition():sendMagicEffect(30)
			player:say("I LOVE TO SHOVEL I LOVE TO SHOVEL", TALKTYPE_SAY)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty")

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
	
	elseif uniqueId == 9002 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 9002 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2376, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sword!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is empty.")
		end
		
	elseif uniqueId == 9003 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 9003 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2455, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a crossbow!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is empty.")
		end
		
	elseif uniqueId == 9004 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 9004 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2175, 1)
			player:addItem(2214, 1)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found spellbook and life ring!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is empty.")
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
