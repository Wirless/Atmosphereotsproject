function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local player = Player(cid) 

	if not Player(cid) then -- If the actor is not a player, return false.
        return false
    end

	

    if player:getStorageValue(55668) == 1 and position.x == 1006 and position.y == 1000 and position.z == 8 then
        local tile = Tile(position)
		local press = tile:getItemById(426)
		local cb = Tile(1003, 998, 8)
        local crownShield = cb:getItemById(2519)
        local rose = cb:getItemById(2745)
        if crownShield and rose then
            position:sendMagicEffect(CONST_ME_MAGIC_RED)
            crownShield:transform(2527)
            rose:remove()
			player:setStorageValue(55668, 1)
        end
	if press then
		press:transform(425)
	end
	
	
    end
end