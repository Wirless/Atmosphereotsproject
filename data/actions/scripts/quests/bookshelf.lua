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
		-- guido key
	
	
    elseif uniqueId == 9001 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 9001 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(5315) -- Guido key
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is empty.")
	end
     
	
	
	
	--key to crypt shambler
	elseif uniqueId == 25303 then -- Check for unique ID 9905 (black knight quest)
        local storageValue = 25303 -- Change this to the storage value required for the quest

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local key = Game.createItem(2087, 1, fromPosition)
			key:setActionId(55431)
			player:setStorageValue(storageValue, 1) -- Set storage value to indicate quest completion
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found key!")
			--player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already completed this quest.")
		end
	
	
	

	
	
	
	
		
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This quest is not scripted yet comeback soon..")
    end

    --item:remove(1) -- Remove the item from the player's inventory
    return true
end
