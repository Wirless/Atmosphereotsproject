--wardrobes


function onUse(player, item, fromPosition, target, toPosition, isHotkey)
		local actionId = item:getActionId()
		if actionId >= 161 and actionId <= 264 then
		local lookType = actionId
		local playerOutfit = player:getOutfit()
		playerOutfit.lookType = lookType
		player:setOutfit(playerOutfit)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your outfit has been changed.")
        return true
		end
		
		local uniqueId = item:getUniqueId()	
		if uniqueId == 36002 then
		local lookType = 5
		local playerOutfit = player:getOutfit()
		playerOutfit.lookType = lookType
		player:setOutfit(playerOutfit)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your outfit has been changed to an orc")
        return true
		elseif uniqueId == 36001 then
		local lookType = 15
		local playerOutfit = player:getOutfit()
		playerOutfit.lookType = lookType
		player:setOutfit(playerOutfit)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your outfit has been changed to an troll")
		elseif uniqueId == 36003 then
		local lookType = 25
		local playerOutfit = player:getOutfit()
		playerOutfit.lookType = lookType
		player:setOutfit(playerOutfit)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your outfit has been changed to an minotaur")
		elseif uniqueId == 36004 then
		local lookType = 62
		local playerOutfit = player:getOutfit()
		playerOutfit.lookType = lookType
		player:setOutfit(playerOutfit)
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your outfit has been changed to an elf")
		
		
		end

end
