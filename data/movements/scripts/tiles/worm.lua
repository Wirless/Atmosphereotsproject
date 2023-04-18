function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    local tile = Tile(position)
    local worms = tile:getItemById(3976)
	local press = tile:getItemById(426)

    if worms and worms:getCount() == 100 then
        --cookies:transform(2128)
		worms:remove()
		local keyItem = cid:addItem(2086, 1)
		keyItem:setActionId(55431)
        position:sendMagicEffect(23)
		local exp = math.random(100, 500)
        cid:addExperience(exp,true )
        --cid:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience for creating key.")
    end
	if press then
		press:transform(425)
	end
end