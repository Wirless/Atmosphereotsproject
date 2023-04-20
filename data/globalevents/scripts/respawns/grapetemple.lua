function onThink(interval, lastExecution)
    local fromPos = {x = 1001, y = 998, z = 7}
    local toPos = {x = 1014, y = 1005, z = 7}
    --for x = fromPos.x, toPos.x do
    --    for y = fromPos.y, toPos.y do
    --        for z = fromPos.z, toPos.z do
    --            Game.createItem(2681, 1, {x = x, y = y, z = z})
    --        end
    --    end
	-- end
    local players = Game.getPlayers()
    for i = 1, #players do
        local player = players[i]
        if player:getPosition():isInRange(fromPos, toPos) then
			Game.createItem(2681, 1, player:getPosition())
            player:say("YES GRAPE!!!!!", TALKTYPE_SAY)
        end
    end
    return true
end
