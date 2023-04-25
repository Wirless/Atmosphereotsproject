






function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local uniqueId = item:getUniqueId()

    if uniqueId == 9905 then 
        local storageValue = 9905 
        local rewardItems = {2476, 2477, 2462} -- The item IDs of the rewards for the black knight quest
        local totalWeight = 0

        -- Calculate the total weight of the reward items
        for i = 1, #rewardItems do
            local itemWeight = ItemType(rewardItems[i]):getWeight()
            totalWeight = totalWeight + itemWeight
        end

        
        if player:getStorageValue(storageValue) == 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
        elseif player:getStorageValue(storageValue) < 1 then
         --   player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must complete the quest before claiming your rewards.")
      --  else
            if player:getFreeCapacity() >= totalWeight then
                -- Give reward for the black knight quest
                for i = 1, #rewardItems do
                    player:addItem(rewardItems[i], 1)
                end
                player:setStorageValue(storageValue, 1) 
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have completed the black knight quest and received your rewards!")
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You already done this .")
            end
        end
	-- banshhee quest
	
	
	--boh
	elseif uniqueId == 25303 then 
        local storageValue = 25303 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2195, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found boots of haste!")
						player:addExperience(math.random(1,1000), true)
			--player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		
		
	
	-- 10k
	elseif uniqueId == 25302 then 
        local storageValue = 25302 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2152, 100)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found platinum coins!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	
	elseif uniqueId == 19100 then 
        local storageValue = 19100 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2512, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a wooden shield!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	
	
	elseif uniqueId == 8141 then 
        local storageValue = 8141 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2393, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found giant sword!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		
	elseif uniqueId == 8142 then 
        local storageValue = 8142 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2528, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found tower shield!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	
	elseif uniqueId == 8140 then 
        local storageValue = 8140 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2165, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found stealth ring!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		
	elseif uniqueId == 8127 then 
        local storageValue = 8127 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local bag = player:addItem(1993)
			bag:addItem(2162, 1) -- magiclightwand
			bag:addItem(2214, 1) -- roh
			bag:addItem(2193, 1) -- ankh

			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a red bag!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		
	elseif uniqueId == 8126 then
        local storageValue = 8126

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2152, 100)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found platinum coins!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		
		
	elseif uniqueId == 8139 then 
        local storageValue = 8139 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2197, 5)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found stone skin amulet!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end


	-- gm isle key
	elseif uniqueId == 5316 then 
        local storageValue = 5316 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(5316) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	-- gm isle key
	elseif uniqueId == 4242 then 
        local storageValue = 4242 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4242) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	-- gm isle key
	elseif uniqueId == 4243 then 
        local storageValue = 4243 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4243) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
			player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	
	--tomb
	--first wand
	elseif uniqueId == 8050 then 
        local storageValue = 8050

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2190, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a wand!")
			player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	elseif uniqueId == 8051 then 
        local storageValue = 8051

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2165, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a stealth ring!")
			player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	elseif uniqueId == 8052 then 
        local storageValue = 8052

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(5818, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a crown backpack!")
			player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	
	elseif uniqueId == 8024 then 
        local storageValue = 8024

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2208, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found an axe ring!")
			player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	
	elseif uniqueId == 4244 then 
        local storageValue = 4244 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4244) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		
	-- carlin
	elseif uniqueId == 4245 then 
        local storageValue = 4245 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4245) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	-- carlin
	elseif uniqueId == 4246 then 
        local storageValue = 4246 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4246) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	-- carlin
	elseif uniqueId == 4247 then 
        local storageValue = 4247 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4247) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	elseif uniqueId == 4248 then 
        local storageValue = 4248 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4248) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		--XD
	elseif uniqueId == 4240 then 
        local storageValue = 4240 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4240) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		--xd
	elseif uniqueId == 4241 then 
        local storageValue = 4241 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4241) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		--stil xding
	elseif uniqueId == 4252 then 
        local storageValue = 4252 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4252) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	--stil xding
	elseif uniqueId == 4251 then 
        local storageValue = 4251 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4251) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	--stil xding
	elseif uniqueId == 4253 then 
        local storageValue = 4253 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4253) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		
		--carlins
	elseif uniqueId == 4254 then 
        local storageValue = 4254 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4254) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		
	elseif uniqueId == 4255 then 
        local storageValue = 4255 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4255) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	elseif uniqueId == 4256 then 
        local storageValue = 4256 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4256) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	elseif uniqueId == 4257 then 
        local storageValue = 4257 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4257) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	elseif uniqueId == 4258 then 
        local storageValue = 4258 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4258) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
		-- NEXT
		elseif uniqueId == 4260 then 
        local storageValue = 4260 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(4260) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	-- black knight key
	
	
    elseif uniqueId == 8033 then 
        local storageValue = 8033 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			local keyItem = player:addItem(2088, 1)
			keyItem:setActionId(2005) 
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a key!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
      
	-- shovel quest
	
	
	elseif uniqueId == 19000 then 
        local storageValue = 19000 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2554, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Try digging the ground outside temple with this!")
			player:getPosition():sendMagicEffect(30)
			player:say("I LOVE TO SHOVEL I LOVE TO SHOVEL", TALKTYPE_SAY)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have already got the shovel now go dig the ground in front of temple!")
		player:getPosition():sendMagicEffect(30)
		player:say("I LOVE TO SHOVEL I LOVE TO SHOVEL", TALKTYPE_SAY)
		player:addItem(2554, 1)
		end
	
	elseif uniqueId == 19002 then 
        local storageValue = 19002 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2681, 4)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found grapes!")
			player:getPosition():sendMagicEffect(30)
			player:say("I LOVE TO SHOVEL I LOVE TO SHOVEL", TALKTYPE_SAY)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty")

		end
	
	
	elseif uniqueId == 8016 then 
        local storageValue = 8016 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2488, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found crown legs!")
						player:addExperience(math.random(1,10000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty")
		end
	
	elseif uniqueId == 9002 then 
        local storageValue = 9002 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2376, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a sword!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is empty.")
		end
		
	elseif uniqueId == 9003 then 
        local storageValue = 9003 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2455, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found a crossbow!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is empty.")
		end
		
	elseif uniqueId == 9004 then 
        local storageValue = 9004 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2175, 1)
			player:addItem(2214, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found spellbook and life ring!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This is empty.")
		end
	
	elseif uniqueId == 8017 then 
        local storageValue = 8017 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2487, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found crown armor!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
		end
	elseif uniqueId == 8011 then 
        local storageValue = 8011 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2520, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found demon shield!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty")
		end
	elseif uniqueId == 8012 then 
        local storageValue = 8012 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2466, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found golden armor!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty")
		end
	elseif uniqueId == 8013 then 
        local storageValue = 8013 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2427, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found guardian halberd!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty")
		end
	elseif uniqueId == 8014 then 
        local storageValue = 8014 

        local totalWeight = 0

		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2164, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found might ring!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty")
		end
	elseif uniqueId == 8088 then 
        local storageValue = 8088 


		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2656, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found blue robe!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty")
		end
	
	
	elseif uniqueId == 8088 then 
        local storageValue = 8088 


		if player:getStorageValue(storageValue) < 1 then
			player:addItem(2656, 1)
			player:setStorageValue(storageValue, 1) 
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found blue robe!")
						player:addExperience(math.random(1,1000), true)
		else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty")
		end
	
	elseif uniqueId == 2 then 
        local storageValue = 200 
        local rewardItem = 200 

        
        if player:getStorageValue(storageValue) == 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It is empty.")
        elseif player:getStorageValue(storageValue) < 1 then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must complete the quest before claiming your reward.")
        else
            
            if player:getFreeCapacity() >= ItemType(rewardItem):getWeight() then
                
                player:addItem(rewardItem, 1)
                player:setStorageValue(storageValue, 1) 
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have completed Quest 2 and received your reward!")
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough capacity to carry the reward for Quest 2.")
            end
        end
		
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This quest is not scripted yet comeback soon..")
    end

   
    return true
end
