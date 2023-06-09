local liquidContainers = {1775, 2005, 2006, 2007, 2008, 2009, 2011, 2012, 2013, 2014, 2015, 2023, 2031, 2032, 2033}
local millstones = {1381, 1382, 1383, 1384}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	if itemId == 2692 then
		if target.type == FLUID_WATER and table.contains(liquidContainers, target.itemid) then
			item:remove(1)
			player:addItem(2693, 1)
			local exp = math.random(5, 50)
			player:addExperience(exp, true)
			--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
			target:getPosition():sendMagicEffect(2)
			target:transform(target.itemid, FLUID_NONE)
			return true
		end
	elseif table.contains(millstones, target.itemid) then
		item:remove(1)
		player:addItem(2692, math.random(1,3))
		local exp = math.random(15, 50)
		player:addExperience(exp, true)
		--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from gathering.")
		player:getPosition():sendMagicEffect(4)
		return true
	end
	return false
end
