function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- define the required vocations and positions
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
        [2378] = {1008, 1048, 8},
        [2455] = {1008, 1037, 8},
        [2175] = {1014, 1043, 8}
    }

    -- check if all players are in the required vocations and positions
    local players_to_teleport = {}
    for name, pos in pairs(required_vocations) do
        local player_vocation = player:getVocation()
        local player_pos = player:getPosition()
        
            table.insert(players_to_teleport, player)
   
            return true
       
    end

    -- check if all required items are present
    local all_items_present = true
    for id, pos in pairs(required_items) do
        local tile = Tile(Position(pos[1], pos[2], pos[3]))
        local item = tile:getItemById(id)
        if not item then
            all_items_present = false
            break
        end
    end

    -- teleport players to the destination if all conditions are met
   
        for _, player in ipairs(players_to_teleport) do
            player:teleportTo(Position(teleport_position[1], teleport_position[2], teleport_position[3]))
        end
        Game.broadcastMessage("Teleporting all players to " .. teleport_position[1] .. ", " .. teleport_position[2] .. ", " .. teleport_position[3], MESSAGE_EVENT_ADVANCE)


    return true
end
