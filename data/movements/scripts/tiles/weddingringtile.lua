function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    local tile = Tile(position)
    local weddingRing = tile:getItemById(2121)
	local press = tile:getItemById(426)

    if weddingRing and getPlayerStorageValue(cid, 55656) >= 1 then
        weddingRing:transform(2128)
        position:sendMagicEffect(CONST_ME_HITBYFIRE)
    end
	if press then
		press:transform(425)
	end
end