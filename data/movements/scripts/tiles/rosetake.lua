function onRemoveItem(item, tile, position, cid)
    if item:getId() == 2527 and position.x == 1003 and position.y == 998 and position.z == 8 then
        local player = Player(cid)
        if player and player:getStorageValue(55669) ~= 1 then -- unique storage value to check if monsters were already spawned
            local fromPos = {x = 1002, y = 998, z = 8}
            local toPos = {x = 1004, y = 1002, z = 11}
            for i = 1, 8 do
                local randomPos = {x = math.random(fromPos.x, toPos.x), y = math.random(fromPos.y, toPos.y), z = toPos.z}
                Game.createMonster("Fire devil", randomPos, true, false)
            end
            player:setStorageValue(55669, 1)
        end
    end
end
