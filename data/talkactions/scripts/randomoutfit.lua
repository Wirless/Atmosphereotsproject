function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local lookType = math.random(168, 200)
	local playerOutfit = player:getOutfit()
	playerOutfit.lookType = lookType
	player:setOutfit(playerOutfit)
	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your outfit has been changed to a random one between lookType 168 and 200.")
	return false
end
