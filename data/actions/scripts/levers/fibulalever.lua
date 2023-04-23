function onUse(player, item, fromPosition, target, toPosition, isHotkey)
     local positions = {
            Position(943, 1019, 8),
            Position(944, 1019, 8),
            Position(945, 1019, 8),
            Position(946, 1019, 8)
        }
	if item.itemid == 1946 then
       
        for _, position in ipairs(positions) do
            local tile = Tile(position)
            local item = tile:getItemById(1498)
            if item then
                item:remove()
            end
        end
        item:transform(1945)
        item:decay()
      elseif item.itemid == 1945 then
        item:transform(1946)
        item:decay()
        for _, position in ipairs(positions) do
            Game.createItem(1498, 1, position)
        end
    end
    return true
end
