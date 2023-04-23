local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, 32)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)
    local distanceSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
    local min = (player:getLevel() / 5) + distanceSkill * 0.7
    local max = (player:getLevel() / 5) + distanceSkill + 5
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
    local target = creature:getTarget()
    if not target or not target:isCreature() then
        return false
    end
    
    local targetPos = target:getPosition()
    local playerPos = creature:getPosition()

    local function launchProjectile(delay)
        local direction = targetPos - playerPos
        direction:normalize()
        direction:mul(3)

        local fromPos = playerPos + direction
        local toPos = fromPos + direction

        local projectile = Projectile(fromPos, toPos, combat:getParameter(COMBAT_PARAM_DISTANCEEFFECT))

        projectile:execute()
        combat:execute(creature, variant)
    end

    launchProjectile(0)
    addEvent(launchProjectile, 300, 1) -- add a second projectile after 300ms

    return true
end
