function onThink(interval, lastExecution)
local players = Game.getPlayers()
for i = 1, #players do
local player = players[i]
if player:isPlayer() then
player:addExperience(1)
player:getPosition():sendMagicEffect(25)
local storageValue = player:getStorageValue(1444444)
player:setStorageValue(1444444, storageValue + 1)

end
end
return true
end