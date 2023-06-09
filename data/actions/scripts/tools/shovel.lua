local items = {
    [1] = { -- Omega (0.1%)
        2159,
        2008,
        2050,
        2047,
        2148,
        1992,
        2050,
        2260,
        2666,
        2183,
        2145,
        2146,
        2147,
        2149,
        2150,
        2260,
        2511,
        2144,
    },
    [2] = { -- ITEMS WITH COUNT AMULETS - 100
        2172,
        2161,
        2200,
        2199,
        2198,
        2170,
    },
}

local holes = {468, 481, 483}



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
    if table.contains(holes, groundId) then
        ground:transform(groundId + 1)
        ground:decay()

        toPosition.z = toPosition.z + 1
        tile:relocateTo(toPosition)
		
	
	elseif groundId == 103 then
	
	
		if player:getLevel() >= 30 then
			local mudspawn3 = math.random(1,100)
				if mudspawn3 == 95 then
				Game.createMonster("Orc Warrior", toPosition)
			elseif mudspawn3 == 90 then
				Game.createMonster("Orc", toPosition)
			elseif mudspawn3 == 85 then
				Game.createMonster("Orc", toPosition)
			elseif mudspawn3 == 80 then
				Game.createMonster("Orc", toPosition)
			elseif mudspawn3 == 75 then
				Game.createMonster("Minotaur", toPosition)
				Game.createMonster("Minotaur", toPosition)
				Game.createMonster("Minotaur", toPosition)
				Game.createMonster("Minotaur", toPosition)
				else
			local amount = math.random(1, 3)
				if player:getFreeCapacity() > 4000 then
				player:addItem(3976, amount) 
				else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You didnt get worms because you have no cap.")
				end
				player:addExperience(amount, true)
				end
		end
		
		if player:getLevel() >= 20 then
			local mudspawn2 = math.random(1, 100)
			if mudspawn2 == 95 then --5%
				Game.createMonster("Orc", toPosition)
			elseif mudspawn2 == 85 then
				Game.createMonster("Elf", toPosition)
			elseif mudspawn2 == 65 then
				Game.createMonster("Orc", toPosition)
			elseif mudspawn2 == 55 then
				Game.createMonster("Minotaur", toPosition)
			elseif mudspawn2 == 45 then
				Game.createMonster("Orc Warrior", toPosition)
				Game.createMonster("Orc", toPosition)
			else
				local amount = math.random(1, 3)
				if player:getFreeCapacity() > 4000 then
				player:addItem(3976, amount) 
				else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You didnt get worms because you have no cap.")
				end
				player:addExperience(amount, true)
			end
		end
		local mudpawn = math.random(1, 100)
		if mudpawn >= 95 then -- 5%
			Game.createMonster("Bug", toPosition)
			elseif mudpawn > 85 and mudpawn < 95 then --10%
				Game.createMonster("Rat", toPosition)
			elseif mudpawn == 65 then --1%
				local chickenchance = math.random(1,10)
				if chickenchance == 1 then
				Game.createMonster("Chicken", toPosition)
				else
				return false
				end
			elseif mudpawn < 2 then --2%
				Game.createMonster("Rotworm", toPosition)
				elseif mudpawn == 1 then --1%
				local amount = math.random(1, 0)
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You didnt get worms because you have no cap.")
				target:getPosition():sendMagicEffect(10)
				player:addExperience(amount, true)
			elseif mudpawn <= 25 then -- 25%
				local amount = math.random(1, 3)
				if player:getFreeCapacity() > 4000 then
				player:addItem(3976, amount) 
				else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You didnt get worms because you have no cap.")
				end
				--Game.createItem(3976, amount, toPosition)

				player:addExperience(amount, true)
				--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering. You found ".. amount .. " worms.")
				toPosition:sendMagicEffect(CONST_ME_POFF)
			else
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end

		
	elseif groundId == 107 then
	
	if player:getCondition(CONDITION_DRUNK) then
				local amount = math.random(20, 40)
				player:addExperience(amount, true)
			end
	
	if player:getLevel() >= 70 then
			local mudspawn3 = math.random(1,1000)
				if mudspawn3 == 95 then
				Game.createMonster("Dwarf Geomancer", toPosition)
			elseif mudspawn3 == 90 then
				Game.createMonster("Dwarf Soldier", toPosition)
				Game.createMonster("Dwarf Guard", toPosition)
			elseif mudspawn3 == 85 then
				Game.createMonster("Dragon", toPosition)
			elseif mudspawn3 == 55 then
				Game.createMonster("Dwarf guard", toPosition)
			elseif mudspawn3 == 54 then
				Game.createMonster("Dwarf guard", toPosition)
				elseif mudspawn3 == 53 then
				Game.createMonster("Dwarf guard", toPosition)
				elseif mudspawn3 == 52 then
				Game.createMonster("Dwarf guard", toPosition)
				elseif mudspawn3 == 51 then
				Game.createMonster("Dwarf guard", toPosition)
			elseif mudspawn3 == 35 then
				Game.createMonster("Dwarf Soldier", toPosition)
				Game.createMonster("Dwarf Soldier", toPosition)
				Game.createMonster("Dwarf Guard", toPosition)
				Game.createMonster("Dwarf", toPosition)
				else
			local amount = math.random(20, 60)
				player:addExperience(amount, true)
				end
		end
		
		if player:getLevel() >= 35 then
			local mudspawn2 = math.random(1, 100)
			if mudspawn2 == 95 then --5%
				Game.createMonster("Wild warrior", toPosition)
			elseif mudspawn2 == 85 then
				Game.createMonster("Smuggler", toPosition)
			elseif mudspawn2 == 65 then
				Game.createMonster("Cyclops", toPosition)
			elseif mudspawn2 == 55 then
				Game.createMonster("Minotaur", toPosition)
			elseif mudspawn2 == 45 then
				Game.createMonster("Orc Warrior", toPosition)
				Game.createMonster("Orc", toPosition)
			else
				local amount = math.random(20, 40)
				player:addExperience(amount, true)
			end
			
		end
		local mudpawn = math.random(1, 100)
		if mudpawn >= 95 then -- 5%
			Game.createMonster("Wolf", toPosition)
			elseif mudpawn > 85 and mudpawn < 95 then --10%
				Game.createMonster("Bear", toPosition)
			elseif mudpawn == 65 then --1%
				Game.createMonster("Rat", toPosition)
				Game.createMonster("Rat", toPosition)
				Game.createMonster("Rat", toPosition)
			elseif mudpawn < 2 then --2%
				Game.createMonster("Rotworm", toPosition)
			elseif mudpawn == 1 then --1%
				local amount = math.random(10, 15)
				player:addExperience(amount, true)
			else
			local amountt = math.random(5, 10)
			player:addExperience(amount, true)
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
		
		
	elseif groundId >= 4526 and groundId <= 4541 then
	if player:getCondition(CONDITION_DRUNK) then
				local amount = math.random(20, 40)
				player:addExperience(amount, true)
			end
	
		if player:getLevel() >= 30 then
			local mudspawn3 = math.random(1,1000)
				if mudspawn3 == 95 then
				Game.createMonster("Bandit", toPosition)
				Game.createMonster("Bandit", toPosition)
			elseif mudspawn3 == 90 then
				Game.createMonster("Cyclops", toPosition)
			elseif mudspawn3 == 85 then
				Game.createMonster("Cyclops", toPosition)
			elseif mudspawn3 == 80 then
				Game.createMonster("Cyclops", toPosition)
			elseif mudspawn3 == 75 then
				Game.createMonster("Smuggler", toPosition)
				Game.createMonster("Smuggler", toPosition)
				Game.createMonster("Minotaur", toPosition)
				Game.createMonster("Minotaur", toPosition)
				else
			local amount = math.random(1, 3)
				if player:getFreeCapacity() > 4000 then
				player:addItem(3976, amount) 
				else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You didnt get worms because you have no cap.")
				end
				player:addExperience(amount, true)
				end
		end


		if player:getLevel() >= 20 then
			local mudspawn2 = math.random(1, 1000)
			if mudspawn2 == 95 then --5%
				Game.createMonster("Wild Warrior", toPosition)
			elseif mudspawn2 == 85 then
				Game.createMonster("Elf", toPosition)
			elseif mudspawn2 == 65 then
				Game.createMonster("Orc", toPosition)
			elseif mudspawn2 == 55 then
				Game.createMonster("Minotaur", toPosition)
			elseif mudspawn2 == 45 then
				Game.createMonster("Orc Warrior", toPosition)
				Game.createMonster("Orc", toPosition)
			else
				local amount = math.random(1, 3)
				if player:getFreeCapacity() > 4000 then
				player:addItem(3976, amount) 
				else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You didnt get worms because you have no cap.")
				end
				player:addExperience(amount, true)
			end
		end
		
		local grasspawn = math.random(1, 1000)
		if grasspawn == 95 then -- 5%
            Game.createMonster("Snake", toPosition)
		elseif grasspawn == 85 then --10%
			Game.createMonster("Spider", toPosition)
		elseif grasspawn == 75 then --10%
			Game.createMonster("Spider", toPosition)
			Game.createMonster("Spider", toPosition)
		elseif grasspawn == 65 then --10%
			Game.createMonster("Orc", toPosition)
		elseif grasspawn == 55 then--10%
			Game.createMonster("Rotworm", toPosition)
		elseif grasspawn == 45 then --10%
			Game.createMonster("Minotaur", toPosition)
		else
			local amount = math.random(1, 3)
			if player:getFreeCapacity() > 4000 then
				player:addItem(3976, amount) 
				else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You didnt get worms because you have no cap.")
				end
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	
	

	elseif target.itemid == 2824 then
        target:transform(3085)
        target:decay()
        if player:getFreeCapacity() > 4000 then
				player:addItem(3976, amount) 
				else
				player:addItem(3976, 3)
				end
        local exp = math.random(10,40)
        player:addExperience(exp, true)
        --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
        target:getPosition():sendMagicEffect(1)	
		
		
    elseif groundId == 231 then
	if player:getCondition(CONDITION_DRUNK) then
				local amount = math.random(10, 30)
				player:addExperience(amount, true)
	end
        local rarity = math.random(1, 1000)
        local randomValue = math.random(1, 1000)

        if randomValue <= 10 then -- 1% chance
            local itemId = items[1][math.random(1, #items[1])]
            Game.createItem(itemId, 1, toPosition)
        elseif randomValue > 10 and randomValue <= 60 then -- 5% chance
            local itemId = items[2][math.random(1, #items[2])]
            Game.createItem(itemId, 100, toPosition)
        elseif randomValue > 60 and randomValue <= 250 then -- 19% chance
            Game.createMonster("Larva", toPosition)
        elseif randomValue > 250 and randomValue <= 280 then -- 3% chance
            Game.createMonster("Larva", toPosition)
            Game.createMonster("Larva", toPosition)
            Game.createMonster("Larva", toPosition)
        elseif randomValue > 280 and randomValue <= 450 then -- 17% chance
            Game.createMonster("Scarab", toPosition)
            Game.createMonster("Larva", toPosition)
        elseif randomValue > 450 and randomValue <= 480 then -- 3% chance
            Game.createMonster("Scarab", toPosition)
            Game.createMonster("Scarab", toPosition)
            Game.createMonster("Larva", toPosition)
        else -- 50% chance
			toPosition:sendMagicEffect(CONST_ME_POFF)
			local amount = math.random(8, 16)
			player:addExperience(amount, true)
        end

        toPosition:sendMagicEffect(CONST_ME_POFF)
	
    else
        return false
    end

    return true
end
