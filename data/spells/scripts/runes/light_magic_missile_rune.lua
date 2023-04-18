local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 0.4) + 3
	local max = (level / 5) + (magicLevel * 0.8) + 5
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant, isHotkey)
    local position = variant:getPosition()
    local tile = Tile(position)
    if tile:getTopCreature() then
        return combat:execute(creature, variant)
    end
         
    creature:sendCancelMessage(RETURNVALUE_CANONLYUSETHISRUNEONCREATURES)
    creature:getPosition():sendMagicEffect(CONST_ME_POFF)
    return false
end

