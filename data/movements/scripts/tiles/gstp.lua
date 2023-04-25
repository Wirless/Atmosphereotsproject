function onStepIn(creature, item, position, fromPosition)
    if item.uid == 27026 then
        creature:teleportTo(Position(943, 905, 7))
		Position(943, 905, 7):sendMagicEffect(15)
    elseif item.uid == 17026 then
        creature:teleportTo(Position(868, 948, 7))
		Position(868, 948, 7):sendMagicEffect(15)
    
	elseif item.uid == 17027 then
        creature:teleportTo(Position(1003, 947, 7))
		Position(1003, 947, 7):sendMagicEffect(15)
    
	elseif item.uid == 27027 then
        creature:teleportTo(Position(1015, 898, 7))
		Position(1015, 898, 7):sendMagicEffect(15)
	elseif item.uid == 17029 then
        creature:teleportTo(Position(955, 1127, 7))
		Position(955, 1127, 7):sendMagicEffect(15)
	elseif item.uid == 27029 then
        creature:teleportTo(Position(1057, 1123, 7))
		Position(1057, 1123, 7):sendMagicEffect(15)
    end
    return true
end
