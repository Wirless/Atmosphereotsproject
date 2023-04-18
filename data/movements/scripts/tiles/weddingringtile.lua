function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    local tile = Tile(position)
    local weddingRing = tile:getItemById(2121)
	local fencetile = Tile(1005, 1005, 8)
	local press = tile:getItemById(426)
	local fence = fencetile:getItemById(1543)

    if weddingRing and getPlayerStorageValue(cid, 55656) >= 1 then
        weddingRing:transform(2128)
        position:sendMagicEffect(CONST_ME_HITBYFIRE)
    end
	if press then
		press:transform(425)
	end
	if getCreatureName(cid) == "skeleton" then

            doRemoveItem(fence.uid, 1)
			doSendMagicEffect(fencetile:getPosition(), CONST_ME_POFF)
  
    end
end




function onStepOut(cid, item, position, lastPosition)
    local tile = Tile(position)
    local fencetile = Tile(1005, 1005, 8)
    local press = tile:getItemById(425)
    if press then
        press:transform(426)
    end
    if getCreatureName(cid) == "skeleton" then
        local fence = fencetile:getItemById(1543)
        if fence then
            doRemoveItem(fence.uid, 1)
			doSendMagicEffect(fencetile:getPosition(), CONST_ME_POFF)
        else
            doCreateItem(1543, 1, {x=1005, y=1005, z=8})
			doSendMagicEffect(fencetile:getPosition(), CONST_ME_POFF)
        end
    end
    return true
end
