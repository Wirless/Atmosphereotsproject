local BACKPACK_IDS = {
1998, -- Green BP 1998
1999, -- Yellow BP 1999
2000, -- Red BP 2000
2001, -- Purple BP 2001
2002, -- Blue BP 2002
2003, -- Grey BP 2003
2004 -- Golden BP 2004
}

local POSITIONS = {
Position(1014, 998, 10), -- Position 1
Position(1016, 1011, 11), -- Position 2
Position(1017, 1011, 11), -- Position 3
Position(1018, 1011, 11), -- Position 4
Position(1001, 1012, 6), --temple +1
Position(1004, 999, 5), --tmeple 2
Position(1024, 1030, 7), -- The magic boat
Position(1030, 1018, 6), --small mountain
Position(1042, 1009, 7), --gm house
Position(946, 1016, 7), -- senja castle
Position(998, 1149, 7), -- carlin
Position(998, 1151, 7), -- carlin2


}

local MAGIC_EFFECT = CONST_ME_MAGIC_BLUE

function onThink(interval, lastExecution)
for _, pos in ipairs(POSITIONS) do
local tile = Tile(pos)
local hasBackpack = false
for _, backpackId in ipairs(BACKPACK_IDS) do
local item = tile:getItemById(backpackId)
if item then
hasBackpack = true
break
end
end
if not hasBackpack then
local backpackId = BACKPACK_IDS[math.random(1, #BACKPACK_IDS)]
Game.createItem(backpackId, 1, pos, math.random(1, 20))
pos:sendMagicEffect(MAGIC_EFFECT, nil)
end
end
return true
end