local ITEM_ID = 2168 -- Item ID of Wedding Ring
local ITEM_COUNT = 1 -- Number of wedding rings to create
local POSITIONS = {
    Position(1011, 1010, 7), -- temple
    Position(1012, 1006, 10), -- tombb
    Position(1016, 1004, 11), -- tomb
	Position(1041, 1006, 6), -- gm house
	Position(987, 925, 7), -- fibulasmall
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
