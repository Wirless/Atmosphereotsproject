local ITEM_ID = 2600 -- Replace with the ID of the item you want to check for
local ITEM_COUNT = 1 -- Replace with the number of items you want to create if they're not present
local POSITION = Position(1009, 1003, 11) -- Replace with the position you want to check

function onThink(interval, lastExecution)
    local tile = Tile(POSITION)
    local item = tile:getItemById(ITEM_ID)

    if not item then
        Game.createItem(ITEM_ID, ITEM_COUNT, POSITION)
		POSITION:sendMagicEffect(CONST_ME_POFF, nil)
    end

    return true
end
