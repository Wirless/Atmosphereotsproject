function onLogin(player)
	local serverName = configManager.getString(configKeys.SERVER_NAME)
	local loginStr = "Welcome to " .. serverName .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		-- Calculate and add experience based on time elapsed since last login
		local secondsElapsed = os.time() - player:getLastLoginSaved()
		local experienceToAdd = math.floor(secondsElapsed)
		local storageValue = player:getStorageValue(55656)
		if storageValue > 0 then
			experienceToAdd = experienceToAdd * storageValue
		end
		player:addExperience(experienceToAdd, true)

		-- Announce the experience gain to the player
		local experienceStr = string.format("You have gained %d experience points for being away.", experienceToAdd)
		player:sendTextMessage(MESSAGE_STATUS_DEFAULT, experienceStr)
		if experienceToAdd > 36000 then
			local message = player:getName() .. " Logged in and got: ".. experienceToAdd .." exp."
			for _, targetPlayer in ipairs(Game.getPlayers()) do
				targetPlayer:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, message)
			end
		end
		loginStr = string.format("Your last visit in %s: %s.", serverName, os.date("%d %b %Y %X", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)


	if player:getStorageValue(556561) < 0 then
		player:setStorageValue(556561,1)
	end



	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(PlayerStorageKeys.promotion)
		if value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
	player:registerEvent("BroadcastKill")
	player:registerEvent("levelmultiplier")
	player:registerEvent("levelup")
	player:registerEvent("ModalWindowHelper")

	return true
end
