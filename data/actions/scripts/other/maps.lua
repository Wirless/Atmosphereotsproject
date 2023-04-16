function onUse(cid, item, fromPosition, itemEx, toPosition)
   local player = Player(cid) -- create a Player object using the cid parameter
 
  if item.itemid == 1956 then
	item:remove(1)-- remove the item from the player's inventory
    local exp = math.random(1, 1000) -- generate a random number between 1 and 1000 for the experience reward
    player:addExperience(exp, true) -- add the experience reward to the player
	--player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You gained " .. exp .. " experience from map.")
	player:getPosition():sendMagicEffect(14)
	
	local message = player:getName() .. " used map and gained: ".. exp .." exp."
        for _, targetPlayer in ipairs(Game.getPlayers()) do
            targetPlayer:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, message)
		end

	
	  return true
  end
  return false
end
