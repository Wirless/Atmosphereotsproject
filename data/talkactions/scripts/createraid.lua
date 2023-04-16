function onSay(player, words, param)
    local params = string.lower(param)
    local monsterName, monsterCount = string.match(params, "(%a+)%s+(%d+)")
    if not monsterName or not monsterCount then
        player:sendCancelMessage("Usage: /createraid <monster name> <monster count>")
        return false
    end

    local pos = player:getPosition()
    local fileName = "data/raids/" .. monsterName .. ".xml"
    local file = io.open(fileName, "w+")

    if not file then
        player:sendCancelMessage("Error creating raid file.")
        return false
    end

    file:write('<?xml version="1.0" encoding="UTF-8"?>\n')
    file:write('<raid>\n')

    file:write('\t<announce delay="1000" type="warning" message="RAIDTEXT..." />\n')
    file:write('\t<announce delay="25000" type="warning" message="RAIDTEXT..." />\n')

    file:write('\t<areaspawn delay="2000" radius="4" centerx="' .. pos.x .. '" centery="' .. pos.y .. '" centerz="' .. pos.z .. '">\n')
    file:write('\t\t<monster name="' .. monsterName .. '" amount="' .. monsterCount .. '" />\n')
    file:write('\t</areaspawn>\n')

    file:write('</raid>')
    file:close()

    player:sendTextMessage(MESSAGE_INFO_DESCR, "Raid file created successfully.")
    return false
end
