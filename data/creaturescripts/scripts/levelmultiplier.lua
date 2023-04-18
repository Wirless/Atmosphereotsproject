function onAdvance(player, skill, oldLevel, newLevel)
    if skill ~= SKILL_LEVEL or oldLevel >= newLevel then
        return true
    end
    
	local currentStorageValue = player:getStorageValue(556561)
	local level = newLevel -- Subtract 1 to exclude the initial level
	local levelsToAdd = math.floor(level / 10)
	local targetStorageValue = levelsToAdd

	if targetStorageValue ~= currentStorageValue then
		player:setStorageValue(556561, targetStorageValue)
		--player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have gained " .. levelsToAdd .. " storage values for every 10 levels.")
	end

	return true
end