local ITEM_ID = 2121 -- Item ID of Wedding Ring
local ITEM_COUNT = 2 -- Number of wedding rings to create
local POSITION_1 = Position(1004, 1005, 11) -- Position 1
local POSITION_2 = Position(1001, 1005, 11) -- Position 2

function onThink(interval, lastExecution)
    local tile1 = Tile(POSITION_1)
    local tile2 = Tile(POSITION_2)
    local item1 = tile1:getItemById(ITEM_ID)
    local item2 = tile2:getItemById(ITEM_ID)

    if not item1 then
        Game.createItem(ITEM_ID, ITEM_COUNT, POSITION_1)
		POSITION_1:sendMagicEffect(CONST_ME_POFF, nil)
    end

    if not item2 then
        Game.createItem(ITEM_ID, ITEM_COUNT, POSITION_2)
		POSITION_2:sendMagicEffect(CONST_ME_POFF, nil)
    end

    return true
end
