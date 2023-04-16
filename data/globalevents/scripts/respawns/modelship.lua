local ITEM_ID = 2113 -- Item ID of model ship
local ITEM_COUNT = 1 -- Number of items to create
local POSITION_1 = Position(1014, 998, 10) -- Position 1

local MAGIC_EFFECT = CONST_ME_MAGIC_BLUE 

function onThink(interval, lastExecution)
    local chance = math.random(1, 5) -- generate a random number between 1 and 5
    if chance == 1 then
        local tile1 = Tile(POSITION_1)
        local item1 = tile1:getItemById(ITEM_ID)
        if not item1 then
            Game.createItem(ITEM_ID, ITEM_COUNT, POSITION_1)
            POSITION_1:sendMagicEffect(CONST_ME_MAGIC_BLUE , nil)
        end
    end

    return true
end
