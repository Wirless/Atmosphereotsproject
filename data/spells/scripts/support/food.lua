local commonFoods = {
2677, -- blueberry
2687, -- cookie
2674, -- apple
2673, -- roll
2696, -- cheese
2677, -- blueberry
2687, -- cookie
2675, -- orange
2679, --cherry
2684, -- carrot
2685, --tomato
2686,	-- corn
2690, -- roll
2695, --egg
2696 --cheese
}

local rareFoods = {
2681, -- grape
2689 -- bread
}

local megaRareFoods = {
2672, -- dragon ham
2678, -- coconut
2676 -- banana
}

function onCastSpell(creature, variant)
	local randomNum = math.random(1, 1000) -- generate a random number from 1 to 1000
		if randomNum == 1 then -- add dragon ham if the generated number is 1
			creature:addItem(megaRareFoods[1])
			local dragonhamexp = math.random(100,2000)
			creature:addExperience(dragonhamexp, true)
			elseif randomNum <= 25 then -- add grape if the generated number is between 25
			local dragonhamexp = math.random(1,200)
			creature:addExperience(dragonhamexp, true)
			creature:addItem(rareFoods[1])
			elseif randomNum <= 100 then -- add bread if the generated number is between 100
			creature:addItem(rareFoods[2])
			local dragonhamexp = math.random(1,50)
			creature:addExperience(dragonhamexp, true)
			else -- add any other common food item
			creature:addItem(commonFoods[math.random(#commonFoods)])
		end
	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end

