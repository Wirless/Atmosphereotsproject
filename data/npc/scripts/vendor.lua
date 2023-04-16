local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local voices = { {text = "Come and take a look at my items!"} }
npcHandler:addModule(VoiceModule:new(voices))

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, text = 'I buy most of things and I sell: spellbook, magic lightwand, mana fluid , staff , crossbow, bow ,blank rune, spear , arrow , bolts and (tools).'})
keywordHandler:addKeyword({'tools'}, StdModule.say, {npcHandler = npcHandler, text = 'I got shovel, rope, scythe, fishing rod what do you want?'})


shopModule:addBuyableItem({'spellbook'}, 2175, 150, 'spellbook')
shopModule:addBuyableItem({'magic lightwand'}, 2162, 400, 'magic lightwand')
shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 					2006, 1000, 	7, 	'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 					2006, 800, 	10,	'life fluid')
shopModule:addBuyableItem({'staff'}, 2401, 2000, 'staff')
shopModule:addBuyableItem({'crossbow'}, 2455, 650, 'crossbow')
shopModule:addBuyableItem({'bow'}, 2456, 250, 'bow')
shopModule:addBuyableItem({'spear'}, 2389, 50, 'spear')
shopModule:addBuyableItem({'blank rune'}, 2260, 1000, 'blank rune')
shopModule:addBuyableItem({'arrow'}, 2544, 5, 'arrow')
shopModule:addBuyableItem({'bolt'}, 2543, 5, 'bolt')
shopModule:addBuyableItem({'scythe'}, 2550, 5000, 'scythe')
shopModule:addBuyableItem({'fishing rod'}, 2580, 10000, 'fishing rod')
shopModule:addBuyableItem({'shovel'}, 2554, 300, 'shovel')
shopModule:addBuyableItem({'rope'}, 2120, 200, 'rope')
shopModule:addBuyableItem({'green backpack'}, 1998, 1000, 'green backpack')
shopModule:addBuyableItem({'yellow backpack'}, 1999, 1000, 'yellow backpack')
shopModule:addBuyableItem({'red backpack'}, 2000, 1000, 'red backpack')
shopModule:addBuyableItem({'purple backpack'}, 2001, 1000, 'purple backpack')
shopModule:addBuyableItem({'blue backpack'}, 2002, 1000, 'blue backpack')



shopModule:addSellableItem({'red rose'}, 2744, 300,'red rose')
shopModule:addSellableItem({'blue rose'}, 2745, 300,'blue rose')
shopModule:addSellableItem({'yellow rose'}, 2746, 300,'yellow rose')
shopModule:addSellableItem({'broom'}, 2551, 500,'broom')
shopModule:addSellableItem({'guardian shield'}, 2515, 750,'guardian shield')
shopModule:addSellableItem({'crown shield'}, 2519, 1000,'crown shield')
shopModule:addSellableItem({'longsword'}, 2397, 51,'longsword')
shopModule:addSellableItem({'short sword'}, 2406, 10,'short sword')
shopModule:addSellableItem({'sword'}, 2376, 25, 'sword')
shopModule:addSellableItem({'sabre'}, 2385, 12,'sabre')
shopModule:addSellableItem({'rapier'}, 2384, 5,'rapier')
shopModule:addSellableItem({'poison dagger'},  2411,  500, 'poison dagger')
shopModule:addSellableItem({'katana'},  2412,  35, 'katana')
shopModule:addSellableItem({'ice rapier'}, 2396, 1000,'ice rapier')
shopModule:addSellableItem({'spike sword'}, 2383, 1000,'spike sword')
shopModule:addSellableItem({'broad sword'},  2413,  500, 'broad sword')
shopModule:addSellableItem({'carlin sword'}, 2395, 118,'carlin sword')
shopModule:addSellableItem({'chain helmet'}, 2458, 35, 'chain helmet')
shopModule:addSellableItem({'chain armor'}, 2464, 55, 'chain armor')
shopModule:addSellableItem({'scythe'}, 2550, 100, 'scythe')
shopModule:addSellableItem({'meat'}, 2666, 5, 'meat')
shopModule:addSellableItem({'morning star'}, 2394, 125, 'morning star')
shopModule:addSellableItem({'fish'}, 2667, 5, 'fish')
shopModule:addSellableItem({'wedding ring'}, 2121, 300, 'wedding ring')
shopModule:addSellableItem({'inkwell'}, 2600, 150, 'inkwell')
shopModule:addSellableItem({'plate shield'}, 2510, 10, 'plate shield')
shopModule:addSellableItem({'viking helmet'}, 2473, 25, 'viking helmet')
shopModule:addSellableItem({'scale armor'}, 2483, 100, 'scale armor')
shopModule:addSellableItem({'bone'}, 2230, 5, 'bone')
shopModule:addSellableItem({'brass helmet'}, 2460, 10, 'brass helmet')
shopModule:addSellableItem({'brass shield'}, 2511, 10, 'brass shield')
shopModule:addSellableItem({'hatchet'}, 2388, 10, 'hatchet')
shopModule:addSellableItem({'mace'}, 2398, 10, 'mace')
shopModule:addSellableItem({'knife'}, 2403, 100, 'knife')
shopModule:addSellableItem({'spear'}, 2389, 5, 'spear')
shopModule:addSellableItem({'crossbow'}, 2455, 150, 'crossbow')
shopModule:addSellableItem({'staff'}, 2401, 250, 'staff')
shopModule:addSellableItem({'battle shield'}, 2513, 125, 'battle shield')
shopModule:addSellableItem({'dwarven shield'}, 2525, 250, 'dwarven shield')
shopModule:addSellableItem({'orcish axe'}, 2428, 200, 'orcish axe')
shopModule:addSellableItem({'battle axe'}, 2378, 100, 'battle axe')
shopModule:addSellableItem({'double axe'}, 2387, 300, 'double axe')

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	if msgcontains(msg, 'longsword')	then
	
	end
				npcHandler.topic[cid] = 1
	
	
	if msgcontains(msg, 'exp scroll') then

	
	end
	

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
