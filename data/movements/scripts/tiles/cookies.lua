function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    local tile = Tile(position)
    local cookies = tile:getItemById(2687)
	local press = tile:getItemById(426)

    if cookies and cookies:getCount() == 100 then
        --cookies:transform(2128)
		cookies:remove()
		cid:addItem(2580, 1)
        position:sendMagicEffect(23)
		local exp = math.random(1000, 5000)
        cid:addExperience(exp)
        cid:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience for getting fishing rod.")
    end
	if press then
		press:transform(425)
	end
end