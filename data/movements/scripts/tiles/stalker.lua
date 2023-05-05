
function onStepIn(cid, item, position, lastPosition)
    local tile = Tile(position)
	local fencetile = Tile(1012, 1001, 10)
	local press = tile:getItemById(426)
	local fence = fencetile:getItemById(1544)
	
	if press then
		press:transform(425)
	end
	if getCreatureName(cid) == "stalker" then

            doRemoveItem(fence.uid, 1)
			doSendMagicEffect(fencetile:getPosition(), CONST_ME_POFF)
  
    end
	
    return true
end

function onStepOut(cid, item, position, lastPosition)
    local tile = Tile(position)
    local fencetile = Tile(1012, 1001, 10)
    local press = tile:getItemById(425)
    if press then
        press:transform(426)
    end
    if getCreatureName(cid) == "stalker" then
        local fence = fencetile:getItemById(1544)
        if fence then
            doRemoveItem(fence.uid, 1)
			doSendMagicEffect(fencetile:getPosition(), CONST_ME_POFF)
        else
            doCreateItem(1544, 1, {x=1010, y=1001, z=9})
			doSendMagicEffect(fencetile:getPosition(), CONST_ME_POFF)
        end
    end
    return true
end
