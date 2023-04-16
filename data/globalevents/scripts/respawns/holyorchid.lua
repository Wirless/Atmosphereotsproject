local ITEM_ID = 2761 -- Item ID of Orchid
local ITEM_COUNT = 1 -- Number of orchids to create
local POSITIONS = {
    Position(1100, 1044, 7),
    Position(1103, 1046, 7),
    Position(1107, 1045, 7),
    Position(1111, 1043, 7),
    Position(1100, 1047, 7),
    Position(1117, 1045, 7),
    Position(1115, 1049, 7),
    Position(1112, 1050, 7),
    Position(1115, 1052, 7),
    Position(1110, 1053, 7),
    Position(1108, 1054, 7),
    Position(1106, 1052, 7),
    Position(1107, 1049, 7),
    Position(1103, 1056, 7),
    Position(1100, 1056, 7),
    Position(1100, 1059, 7),
    Position(1096, 1059, 7),
    Position(1094, 1055, 7),
    Position(1095, 1049, 7),
    Position(1093, 1052, 7),
    Position(1090, 1054, 7),
    Position(1090, 1057, 7),
    Position(1092, 1057, 7),
    Position(1090, 1059, 7)
}
local MAGIC_EFFECT = CONST_ME_MAGIC_BLUE 

function onThink(interval, lastExecution)
    for _, pos in ipairs(POSITIONS) do
        local xOffset = math.random(-1, 1)
        local yOffset = math.random(-1, 1)
        local newPos = Position(pos.x + xOffset, pos.y + yOffset, pos.z)
        local tile = Tile(newPos)
        local topItem = tile:getTopTopItem()
        if not topItem or topItem:getId() ~= ITEM_ID then
            Game.createItem(ITEM_ID, ITEM_COUNT, newPos)
            newPos:sendMagicEffect(MAGIC_EFFECT, nil)
        end
    end
    return true
end