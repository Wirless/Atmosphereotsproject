function onStepIn(cid, item, position, lastPosition)
    local player = Player(cid)
    if not player then
        return false
    end
    
    local coalBasinPos = Position(1113, 1026, 10)
    local coalBasinItem = Tile(coalBasinPos):getItemById(6560)
    
    if coalBasinItem then
        coalBasinItem:remove(1)
        player:teleportTo(Position(1107, 1027, 10))
        return true
    end
    
    return false
end