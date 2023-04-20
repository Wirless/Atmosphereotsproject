function onSay(player, words, param)
    local players = Game.getPlayers()
    for i = 1, #players do
        local targetPlayer = players[i]
        if targetPlayer:isPlayer() then
            targetPlayer:addItem(2554, 1)
            targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have received a shovel.")
			player:addExperience(1, true)
            targetPlayer:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
        end
    end


    return true
end
