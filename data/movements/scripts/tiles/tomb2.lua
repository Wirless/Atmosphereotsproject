function onStepIn(creature, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return false
    end
    
    player:teleportTo(Position(1112, 1030, 10))
    return true
end
