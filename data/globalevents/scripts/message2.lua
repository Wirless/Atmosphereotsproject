

function onThink(interval, lastExecution)
    local players = Game.getPlayers()
    for _, cid in ipairs(players) do
       cid:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "https://discord.gg/pg2d95uqsH   You can do many different actions to receive experience on the server such as fishing or harvesting or even digging worms.")
    end
    return true
end
