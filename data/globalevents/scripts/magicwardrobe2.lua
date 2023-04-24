function onThink(interval, lastExecution)
    local item = Tile(Position(1006, 999, 7)):getItemById(1711)
    if item then
        local newActionId = math.random(229, 264)
        item:setActionId(newActionId)
		local position = Position(1006, 999, 7)
        position:sendMagicEffect(math.random(15,30))
    end
    return true
end
