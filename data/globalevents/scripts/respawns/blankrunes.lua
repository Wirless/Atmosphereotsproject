local ITEM_ID = 2260 -- Item ID of Wedding Ring
local ITEM_COUNT = 2 -- Number of wedding rings to create
local POSITIONS = {
    Position(946, 1024, 6), -- Position 1
    Position(943, 1024, 6), -- Position 2
    Position(1002, 1011, 9), -- Position 3
	Position(1041, 1006, 6), -- gm house
}
local MAGIC_EFFECT = CONST_ME_MAGIC_BLUE 

function onThink(interval, lastExecution)
    for _, pos in ipairs(POSITIONS) do
        local tile = Tile(pos)
        local item = tile:getItemById(ITEM_ID)
        if not item then
            Game.createItem(ITEM_ID, ITEM_COUNT, pos)
            pos:sendMagicEffect(MAGIC_EFFECT, nil)
        end
    end
    return true
end
