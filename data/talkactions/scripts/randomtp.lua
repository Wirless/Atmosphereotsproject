

local maxPlayersPerMessage = 10

function onSay(player, words, param)
	local players = Game.getPlayers()
	local onlineList = {}

	for _, targetPlayer in ipairs(players) do
		if player:canSeeCreature(targetPlayer) then
			table.insert(onlineList, ("%s [%d]"):format(targetPlayer:getName(), targetPlayer:getLevel()))
		end
	end
	if #players > 0 then
	local randomPlayer = players[math.random(#players)]
	player:teleportTo(randomPlayer:getPosition())

else
	player:say("No other players online.", TALKTYPE_MONSTER_SAY)
end
	local playersOnline = #onlineList


	return false
end
