local function changeOutfitColors(cid, lookType, colorLegs, colorBody, colorHead, colorFeet)
    local outfit = getCreatureOutfit(cid)
	outfit.lookType = lookType
    outfit.lookLegs = colorLegs
    outfit.lookBody = colorBody
    outfit.lookHead = colorHead
    outfit.lookFeet = colorFeet
    doCreatureChangeOutfit(cid, outfit)
end

function onThink(interval, lastExecution)
    local players = getPlayersOnline()
    for _, cid in ipairs(players) do
        local storage_value = getCreatureStorage(cid, 6969)
        if storage_value == 1 then
            local random_color = math.random(1, 132)
            local outfit = getCreatureOutfit(cid)
            outfit.lookHead = random_color
            outfit.lookBody = random_color
            outfit.lookLegs = random_color
            outfit.lookFeet = random_color
            
            doCreatureChangeOutfit(cid, outfit)
		
        end
    end
    return true
end
