local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = { {text = "Fucking thiefs stole my backpacks!"} }
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = 'I sell rune backpacks.'})




shopModule:addBuyableItem({'explo backpack'}, 5776, 10000, 'explosion backpack')
shopModule:addBuyableItem({'gfb backpack'}, 5777, 10000, 'gfb backpack')
shopModule:addBuyableItem({'hmm backpack'}, 5778, 10000, 'hmm backpack')
shopModule:addBuyableItem({'ih backpack'}, 5779, 10000, 'ih backpack')
shopModule:addBuyableItem({'lmm backpack'}, 5780, 10000, 'lmm backpack')
shopModule:addBuyableItem({'mw backpack'}, 5781, 10000, 'mw backpack')
shopModule:addBuyableItem({'sd backpack'}, 5782, 10000, 'sd backpack')
shopModule:addBuyableItem({'uh backpack'}, 5783, 10000, 'uh backpack')



function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

		if msgcontains(msg, 'shovel') then
			npcHandler:say("Do you want a shovel for 100 gold coins?", cid)
			npcHandler.topic[cid] = 1

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
