local foods = {
	[2362] = {5, "Crunch."}, -- carrot
	[2666] = {15, "Munch."}, -- meat
	[2667] = {12, "Munch."}, -- fish
	[2668] = {10, "Mmmm."}, -- salmon
	[2669] = {17, "Munch."}, -- northern pike
	[2670] = {4, "Gulp."}, -- shrimp
	[2671] = {30, "Chomp."}, -- ham
	[2672] = {60, "Chomp."}, -- dragon ham
	[2673] = {5, "Yum."}, -- pear
	[2674] = {6, "Yum."}, -- red apple
	[2675] = {13, "Yum."}, -- orange
	[2676] = {8, "Yum."}, -- banana
	[2677] = {1, "Yum."}, -- blueberry
	[2678] = {18, "Slurp."}, -- coconut
	[2679] = {1, "Yum."}, -- cherry
	[2680] = {2, "Yum."}, -- strawberry
	[2681] = {9, "Yum."}, -- grapes
	[2682] = {20, "Yum."}, -- melon
	[2683] = {17, "Munch."}, -- pumpkin
	[2684] = {5, "Crunch."}, -- carrot
	[2685] = {6, "Munch."}, -- tomato
	[2686] = {9, "Crunch."}, -- corncob
	[2687] = {2, "Crunch."}, -- cookie
	[2688] = {2, "Munch."}, -- candy cane
	[2689] = {10, "Crunch."}, -- bread
	[2690] = {3, "Crunch."}, -- roll
	[2691] = {8, "Crunch."}, -- brown bread
	[2695] = {6, "Gulp."}, -- egg
	[2696] = {9, "Smack."}, -- cheese
	[2787] = {9, "Munch."}, -- white mushroom
	[2788] = {4, "Munch."}, -- red mushroom
	[2789] = {22, "Munch."}, -- brown mushroom
	[2790] = {30, "Munch."}, -- orange mushroom
	[2791] = {9, "Munch."}, -- wood mushroom
	[2792] = {6, "Munch."}, -- dark mushroom
	[2793] = {12, "Munch."}, -- some mushrooms
	[2794] = {3, "Munch."}, -- some mushrooms
	[2795] = {36, "Munch."}, -- fire mushroom
	[2796] = {5, "Munch."}, -- green mushroom
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	
	local food = foods[item.itemid]
	if not food then
		return false
	end

	local condition = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition and math.floor(condition:getTicks() / 1000 + (food[1] * 12)) >= 1200 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are full.")
		player:addMana(math.random(food[1],food[1]*2)) 
		player:addHealth(math.random(food[1],food[1]*2))
		player:say(food[2], TALKTYPE_MONSTER_SAY)
		item:remove(1)
	else
		player:feed(food[1] * 12)
		player:say(food[2], TALKTYPE_MONSTER_SAY)
		item:remove(1)
	end
	
	if item.itemid == 2681 then
		local exp = math.random(1, 50)
		player:addExperience(exp, true)
		--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from eating.")
	end
	
	if item.itemid == 2689 then
		local exp = math.random(1, 100)
		player:addExperience(exp, true)
		--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from eating.")
	end
	-- EGG HEALTH
	if item.itemid == 2695 then
		local exp = math.random(1, 120)
		player:addExperience(exp, true)
		player:addHealth(math.random(food[1],food[1]*3))
		if exp >= 100 then
		Game.createMonster("Chicken", toPosition)
		Game.createMonster("Chicken", toPosition)
		Game.createMonster("Chicken", toPosition)
		elseif exp >= 90 then
		Game.createMonster("Chicken", toPosition)
		Game.createMonster("Chicken", toPosition)
		elseif exp >= 70 then
		Game.createMonster("Chicken", toPosition)
		end
		--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from eating.")
	end
	
	if item.itemid == 2670 then
		local exp = math.random(1, 30)

		player:addExperience(exp, true)
		--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from eating.")
	end
	
	if item.itemid == 2669 then
		local exp = math.random(1, 120)
		player:addExperience(exp, true)
		player:addMana(math.random(food[1],food[1]*2)) 
		--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from eating.")
	end
	
	if item.itemid == 2667 then
		local exp = math.random(1, 60)
		player:addExperience(exp, true)
			return true
		
		--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from eating.")
	end
	
	
	if item.itemid == 2682 then

		local exp = math.random(1, 20)
		player:addExperience(exp, true)
			return true
		
		--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from eating.")
	end
	
	-- Add a unique storage to keep track of successful uses of the item
        local USES_STORAGE = 2689
        local uses = player:getStorageValue(USES_STORAGE) + 1
        player:setStorageValue(USES_STORAGE, uses)

        -- Check if the player has used the item 100 times, and reward them with random exp if true
        if uses % 100 == 0 then
            local reward = math.random(100, 500)
            player:addExperience(reward, true)
            --player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. reward .. " experience from eating!")
            player:setStorageValue(USES_STORAGE, 0)
			player:getPosition():sendMagicEffect(28)
        end
	
	
	return true
end






