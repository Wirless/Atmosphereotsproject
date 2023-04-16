function onStepIn(creature, item, position, fromPosition)
    if creature:isPlayer() then
        creature:addExperience(5)
    end
    return true
end
