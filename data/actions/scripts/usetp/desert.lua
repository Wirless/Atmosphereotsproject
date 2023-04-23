function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- define the required vocations and their positions
    local required_vocations = {
        ["sorcerer"] = {1012, 1043, 8},
        ["druid"] = {1004, 1043, 8},
        ["knight"] = {1008, 1047, 8},
        ["paladin"] = {1008, 1039, 8}
    }
    local teleport_position = {1007, 1031, 8}
	
    -- define the required items and their positions
    local required_items = {
        [2674] = {1002, 1043, 8},
        [2376] = {1008, 1048, 8},
        [2455] = {1008, 1037, 8},
        [2175] = {1014, 1043, 8}
    }
    
    -- check if all required items are present in their respective positions
    for itemId, pos in pairs(required_items) do
        local tile = Tile(Position(pos))
        local itemOnTile = tile:getItemById(itemId)
        if not itemOnTile then
            player:sendCancelMessage("You are missing some required items.")
            return true
        end
    end
    
    -- check if players are on required vocations' positions
    for vocation, pos in pairs(required_vocations) do
        local tile = Tile(Position(pos))
        local creatureOnTile = tile:getTopCreature()
        if creatureOnTile and creatureOnTile:isPlayer() and creatureOnTile:getVocation():getName():lower() == vocation then
            -- teleport all players to the designated position
            creatureOnTile:teleportTo(Position(teleport_position))
        else
            player:sendCancelMessage("You need players of required vocations on their designated positions.")
            return true
        end
    end
    
    -- remove all required items from the top of coal basins
    for itemId, pos in pairs(required_items) do
        local tile = Tile(Position(pos))
        local itemOnTile = tile:getItemById(itemId)
        if itemOnTile then
            local tileAbove = Tile(Position(pos.x, pos.y, pos.z + 1))
            local itemOnTileAbove = tileAbove:getItemById(itemId)
            if itemOnTileAbove then
                itemOnTileAbove:remove()
            else
                itemOnTile:remove()
            end
        end
    end
    
    return true
end
