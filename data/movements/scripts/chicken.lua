

local EGG_ITEMID = 2695
local CHICKEN_NAME = "chicken"
local EGG_CHANCE = 20

function onStepIn(creature, item, position, fromPosition)
    if creature:isMonster() and creature:getName():lower() == CHICKEN_NAME then
        if math.random(1000) <= EGG_CHANCE then
            Game.createItem(EGG_ITEMID, 1, position)
        end
    end
end
