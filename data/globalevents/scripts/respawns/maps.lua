

local ITEM_ID = 1956-- Item ID of Wedding Ring
local ITEM_COUNT = 1 -- Number of wedding rings to create
local POSITIONS = {
    Position(1010, 998, 10), -- temple
    Position(1109, 1051, 7), -- tombb
	Position(906, 1039, 7), -- senja
	Position(1008, 1000, 7), -- temple124
	Position(1057, 856, 6), -- banshee

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
