function onStepIn(cid, item, position, lastPosition)
    local tile = Tile(position)
	local fencetile = Tile(1010, 1013, 8)
	local press = tile:getItemById(426)
	local fence = fencetile:getItemById(1543)
	
	if press then
		press:transform(425)
	end
	if getCreatureName(cid) == "pig" then

            doRemoveItem(fence.uid, 1)
			doSendMagicEffect(fencetile:getPosition(), CONST_ME_POFF)
  
    end
	
    return true
end

function onStepOut(cid, item, position, lastPosition)
    local tile = Tile(position)
    local fencetile = Tile(1010, 1013, 8)
    local press = tile:getItemById(425)
    if press then
        press:transform(426)
    end
    if getCreatureName(cid) == "pig" then
        local fence = fencetile:getItemById(1543)
        if fence then
            doRemoveItem(fence.uid, 1)
			doSendMagicEffect(fencetile:getPosition(), CONST_ME_POFF)
        else
            doCreateItem(1543, 1, {x=1010, y=1013, z=8})
			doSendMagicEffect(fencetile:getPosition(), CONST_ME_POFF)
        end
    end
    return true
end
