local OPCODE_LANGUAGE = 1

function onExtendedOpcode(player, opcode, buffer)
	if opcode == OPCODE_LANGUAGE then
		-- otclient language
		if buffer == 'en' or buffer == 'pt' then
			-- example, setting player language, because otclient is multi-language...
			-- player:setStorageValue(SOME_STORAGE_ID, SOME_VALUE)
		end
	else
		-- other opcodes can be ignored, and the server will just work fine...
	end
	print(buffer)
	if opcode == 15 then
		if not (buffer == "getRefresh") then
			if buffer == "sendBanana" then
				print("banana was given")
				player:setStorageValue(1311, (player:getStorageValue(1311) + 1))
				player:addItem(2676, 1)
			end
		end
	
	local response = {
		clicksAmount = player:getStorageValue(1311), -- clicks amount
		}
		player:sendExtendedOpcode(15, json.encode(response))		
	end
end
