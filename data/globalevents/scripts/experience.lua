function onThink(interval, lastExecution)
    local players = Game.getPlayers()
    for i = 1, #players do
        local player = players[i]
        if player:isPlayer() then
            local expToAdd = 1
			-- 55656 IS THE MULTIPLIER IT WILL BE USED ON ALL OF THE sarkofags xd.
            local storageValue = player:getStorageValue("55656")
            if storageValue > 1 then
                expToAdd = storageValue
            end
			
			
			local levelxamount = player:getStorageValue(556561)
			--expToAdd = player:getStorageValue(556561)
			--if levelxamount > 1 then
			--	exptoAdd = levelxamount
			--end
			--end
			
             if player:getStorageValue(156001) == 1 then
                player:addExperience(expToAdd)
            else
                player:addExperience(expToAdd, true)
            end
            player:addManaSpent(1)
            player:addSkillTries(SKILL_FIST, 1)
            player:addSkillTries(SKILL_CLUB, 1)
            player:addSkillTries(SKILL_SWORD, 1)
            player:addSkillTries(SKILL_AXE, 1)
            player:addSkillTries(SKILL_DISTANCE, 1)
            player:addSkillTries(SKILL_SHIELD, 1)
            local currentStorageValue = player:getStorageValue(1444444)
            player:setStorageValue(1444444, currentStorageValue + 1)
        end
    end
    return true
end