function onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    local destination = Position(1039, 1064, 7) -- replace x, y, and z with the desired coordinates
    player:teleportTo(destination)
    return true
end
