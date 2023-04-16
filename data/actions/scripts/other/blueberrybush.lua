function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:addExperience(2, true)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You gained 2 experience from gathering.")
	item:transform(2786)
	item:decay()
	--Game.createItem(2677, 3, fromPosition)
	player:addItem(2677, math.random(1,3))
	player:getPosition():sendMagicEffect(13)
	return true
end
