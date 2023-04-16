function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	target:getPosition():sendMagicEffect(CONST_ME_POFF)
	local targets = {806, 804, 4833}
	if isInArray(targets, target.itemid) then
		local chance = math.random(1, 100)
		if chance <= 3 then
			player:addItem(math.random(2680, 2682), math.random(1,2))
			player:addExperience(math.random(50, 200), true)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. math.random(50, 200) .. " experience from gathering a rare food.")
		elseif chance <= 33 then
			player:addItem(math.random(2685, 2686), math.random(1,2))
			player:addExperience(math.random(10, 75), true)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. math.random(10, 75) .. " experience from gathering a common food.")
		else
			player:addExperience(math.random(1, 25), true)
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. math.random(1, 25) .. " experience from gathering.")
			return true
		end
	end
	return destroyItem(player, target, toPosition)
end
