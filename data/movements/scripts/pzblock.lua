function onStepIn(cid, item, position, lastPosition)
    local tile = Tile(position)
    local creature = tile:getTopCreature()
    if creature and creature:isMonster() then
	doSendMagicEffect(creature:getPosition(), CONST_ME_POFF)
        creature:remove()
    end
    return true
end
