function onThink(interval, lastExecution)
    local players = Game.getPlayers()
    for i = 1, #players do
        local player = players[i]
        if player:isPlayer() then
            local expToAdd = 1
            local storageValue = player:getStorageValue("55656")
            if storageValue > 1 then
                expToAdd = storageValue
            end
			
			local skillTriesToAdd = 1
			local manaSpentToAdd = 1
			if player:getCondition(CONDITION_DRUNK) then
				expToAdd = expToAdd * 2
				skillTriesToAdd = skillTriesToAdd * 2
				manaSpentToAdd = manaSpentToAdd * 2
			end
			
            if player:getStorageValue(156001) == 1 then
                player:addExperience(expToAdd)
            else
                player:addExperience(expToAdd, true)
            end
			
            player:addManaSpent(manaSpentToAdd)
            player:addSkillTries(SKILL_FIST, skillTriesToAdd)
            player:addSkillTries(SKILL_CLUB, skillTriesToAdd)
            player:addSkillTries(SKILL_SWORD, skillTriesToAdd)
            player:addSkillTries(SKILL_AXE, skillTriesToAdd)
            player:addSkillTries(SKILL_DISTANCE, skillTriesToAdd)
            player:addSkillTries(SKILL_SHIELD, skillTriesToAdd)
            local currentStorageValue = player:getStorageValue(1444444)
            player:setStorageValue(1444444, currentStorageValue + 1)
        end
    end
    return true
end
