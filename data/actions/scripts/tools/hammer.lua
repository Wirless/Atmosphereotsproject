local messages = {
	"<clink clank>",
	"<Cling Click>",
	"<Smash>",

}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)


	if target.itemid == 6464 then
		target:transform(6465)
		target:getPosition():sendMagicEffect(4)
		player:say(messages[math.random(1,#messages)], TALKTYPE_MONSTER_SAY)

	end

end

