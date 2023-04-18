function onAdvance(player, skill, oldLevel, newLevel)
    if skill == SKILL_LEVEL and oldLevel < newLevel then
        local message = string.format("%s has advanced to level %d!", player:getName(), newLevel)
        Game.broadcastMessage(message, MESSAGE_STATUS_CONSOLE_YELLOW)
    end
    return true
end
