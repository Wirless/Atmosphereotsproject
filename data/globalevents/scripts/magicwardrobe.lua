function onThink(interval, lastExecution)
    local item = Tile(Position(1005, 999, 7)):getItemById(1710)
    if item then
        local newActionId = math.random(161, 200)
        item:setActionId(newActionId)
		local position = Position(1005, 999, 7)
        position:sendMagicEffect(math.random(15,44))
    end
    return true
end
