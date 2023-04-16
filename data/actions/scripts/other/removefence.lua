function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local fencePos = {x = 1005, y = 1000, z = 8} -- Replace with the position of the fence to be removed
    local tile = Tile(fencePos)
    local fence = tile:getThing(1543)

    if fence and fence:getId() == 1543 then
        fence:remove()
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You remove the fence.")
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "There is no fence to remove here.")
    end

    item:remove(1)
    return true
end
