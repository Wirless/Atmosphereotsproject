function onKill(cid, target)
    local player = Player(cid)
    local targetName = getCreatureName(target)
    if isMonster(target) then
		local storageKey = "kills_" .. targetName
        local totalKills = player:getStorageValue(storageKey) or 0
        totalKills = totalKills + 1
        player:setStorageValue(storageKey, totalKills)
        local message = player:getName() .. " has killed a " .. targetName .. "! Total monsters killed: " .. totalKills
        for _, targetPlayer in ipairs(Game.getPlayers()) do
            targetPlayer:sendTextMessage(MESSAGE_EVENT_DEFAULT, message)
        end
        
     
    end
    return true
end
