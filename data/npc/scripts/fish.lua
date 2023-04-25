local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = { {text = "FISHH FISH FISH!"} }
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'spellbook'}, 2175, 150, 'spellbook')
shopModule:addBuyableItem({'magic lightwand'}, 2162, 400, 'magic lightwand')


function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

		if msgcontains(msg, 'sell %s shrimp') then
			npcHandler:say("Do you want to sell  shrimp for 2 gold coins?", cid)
			npcHandler.topic[cid] = 1
		elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
			

		elseif msgcontains(msg, 'longsword') then
			-- add code for longsword here
			npcHandler.topic[cid] = 2

		elseif msgcontains(msg, 'exp scroll') then
			-- add code for exp scroll here
			npcHandler.topic[cid] = 3

		--elseif npcHandler.topic[cid] == 1 and msgcontains(msg, 'yes') then
		--	if doPlayerRemoveMoney(cid, 100) then
		--		doPlayerAddItem(cid, 2554, 1)
		--		npcHandler:say("Here's your shovel.", cid)
		--	else
		--		npcHandler:say("You don't have enough gold coins.", cid)
		--	end

		end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
