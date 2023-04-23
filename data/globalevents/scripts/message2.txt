

function onThink(interval, lastExecution)
    local players = Game.getPlayers()
    for _, cid in ipairs(players) do
       cid:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Remember gamemasters will never ask you what is your fishing skill. Protect your account and do not share information.")
    end
    return true
end
