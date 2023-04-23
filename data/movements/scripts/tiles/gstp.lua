function onStepIn(creature, item, position, fromPosition)
    if item.uid == 27026 then
        creature:teleportTo(Position(943, 905, 7))
		Position(943, 905, 7):sendMagicEffect(15)
    elseif item.uid == 17026 then
        creature:teleportTo(Position(868, 948, 7))
		Position(868, 948, 7):sendMagicEffect(15)
    end
    return true
end
