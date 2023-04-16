local monsters = {"Orc warlord", "Hero", "Dragon", "Dragon Lord", "Warlock"} -- example list of monster Name



local function getArea(fromPos, toPos)
    local monsters = {}
    for x = fromPos.x, toPos.x do
        for y = fromPos.y, toPos.y do
            for z = fromPos.z, toPos.z do
                local tile = Tile(Position(x, y, z))
                if tile then
                    local creature = tile:getTopCreature()
                    if creature and creature:isMonster() then
                        table.insert(monsters, creature)
                    end
                end
            end
        end
    end
    return monsters
end

	
function onThink(interval, lastExecution, fromPos, toPos)
    local fromPos = {x = 1001, y = 1005, z = 4} -- example fromPosition
    local toPos = {x = 1015, y = 1011, z = 4} -- example toPosition

    local area = getArea(fromPosition, toPosition)
    local hasMonsters = false
    for _, pos in ipairs(area) do
        local tile = Tile(pos)
        if tile and tile:getTopCreature() and tile:getTopCreature():isMonster() then
            hasMonsters = true
            break
        end
    end

    if not hasMonsters then
        local randomPos = {x = math.random(fromPosition.x, toPosition.x), y = math.random(fromPosition.y, toPosition.y), z = fromPosition.z}
        local randomMonster = monsters[math.random(1, #monsters)]
        Game.createMonster(randomMonster, randomPos, true, false)
    end

    return true
end