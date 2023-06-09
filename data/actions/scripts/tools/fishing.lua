local waterIds = {493, 4608, 4609, 4610, 4611, 4612, 4613, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 7236, 10499, 15401, 15402}
local useWorms = true


local SUCCESSFUL_USES_STORAGE = 2580 -- Change to any unused value

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	
	--if player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
    --    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You can't fish in protection zone. Try Sunday The holy AFK Day.")
    --    return false
    --end
	
	local targetId = target.itemid
	if not table.contains(waterIds, target.itemid) then
		return false
	end
		toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
		toPosition:sendMagicEffect(2)
		local exp = math.random(1,30)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from fishing.")		


	if targetId == 493 then
		return true
	end

	player:addSkillTries(SKILL_FISHING, 1)
	if math.random(1, 100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
		if useWorms and not player:removeItem(3976, 1) then
			return true
		end

	--if player:getCondition(CONDITION_DRUNK) then
	--			player:addExperience(shrimp, true)
	--		else
		-- roll what player got
		local rareChance = math.random(1, 1000)
		
		if rareChance == 1 then
			if player:getFreeCapacity() > 4000 then
			player:addItem(2669, 1)
			else
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Not adding fish because no cap.")	
			end
			local northernpikeexp = math.random(50,100)
			if player:getCondition(CONDITION_DRUNK) then
				player:addExperience(northernpikeexp, true)
			end
			if player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
				player:addExperience(northernpikeexp/6, true)
			else
			player:addExperience(northernpikeexp/2, true)
			end
		
		elseif rareChance <= 100 then
		
			if player:getFreeCapacity() > 4000 then
			player:addItem(2667, 1)
			else
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Not adding fish because no cap.")	
			end
			local midexp = math.random(10,60)
			
			if player:getCondition(CONDITION_DRUNK) then
				player:addExperience(midexp, true)
			end
			if player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
				player:addExperience(midexp/6, true)
			else
			player:addExperience(midexp/2, true)
			end
		else
			if player:getFreeCapacity() > 4000 then
			player:addItem(2670, 1)
			else
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Not adding fish because no cap.")	
			end
			local shrimp = math.random(1,30)
			if player:getCondition(CONDITION_DRUNK) then
				player:addExperience(shrimp, true)
			end
			if player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
				player:addExperience(shrimp/6, true)
			else
			player:addExperience(shrimp/2, true)
			end
		end
		
		
		
		 -- Increment successful uses and check if reset is needed
    local successfulUses = player:getStorageValue(SUCCESSFUL_USES_STORAGE) + 1
    player:setStorageValue(SUCCESSFUL_USES_STORAGE, successfulUses)
    if successfulUses % 10000 == 0 then
        -- Award random experience between 100 and 1000
        local exp = math.random(100, 1000)
        player:addExperience(exp, true)
		player:setStorageValue(55656, player:getStorageValue(55656) + 1)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from successful gathering!")
        player:setStorageValue(SUCCESSFUL_USES_STORAGE, 0) -- Reset successful uses
		player:getPosition():sendMagicEffect(28)
    end
	
	
	end
	
	
	
	return true
end
