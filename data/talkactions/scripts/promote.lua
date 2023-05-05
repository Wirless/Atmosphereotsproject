function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local target = Player(param)
	if not target then
		player:sendCancelMessage("Player not found.")
		return false
	end

	if target:getGroup():getAccess() then
		player:sendCancelMessage("You cannot promote this player.")
		return false
	end

	local vocationId = target:getVocation():getId()

	if vocationId == 1 then
		target:setVocation(Vocation(5))
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have promoted ".. target:getName() .." to master sorcerer.")
	elseif vocationId == 2 then
		target:setVocation(Vocation(6))
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have promoted ".. target:getName() .." to elder druid.")
	elseif vocationId == 3 then
		target:setVocation(Vocation(7))
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have promoted ".. target:getName() .." to royal paladin.")
	elseif vocationId == 4 then
		target:setVocation(Vocation(8))
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have promoted ".. target:getName() .." to elite knight.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You cannot promote ".. target:getName() ..".")
	end

	return false
end
