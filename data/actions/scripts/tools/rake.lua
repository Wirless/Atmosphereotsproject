function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local tile = Tile(toPosition)
    if not tile then
        return false
    end

    local ground = tile:getGround()
    if not ground then
        return false
    end

    local groundId = ground:getId()
  

		
		
	if groundId == 103 then
	toPosition:sendMagicEffect(17)
    local rand = math.random(1, 100)
		if rand <= 5 then
			--target:transform(806)
			Game.createItem(806, 1, toPosition)
		elseif rand <= 99 then
		   Game.createItem(4833, 1, toPosition)
		else
			Game.createItem(804, 1, toPosition)
		end


	
 
	

	elseif target.itemid == 2824 then
        target:getPosition():sendMagicEffect(1)	
		
		
        
	
    else
        return false
    end
	end