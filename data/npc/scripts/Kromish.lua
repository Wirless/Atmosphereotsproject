local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local shopItems = { -- Define the NPC's stock
  {itemid = 2160, buy = 50, sell = 5}, -- Item ID, buy price, sell price
  {itemid = 2398, buy = 5000, sell = 500},
  {itemid = 2148, buy = 100, sell = 10},
  -- Add additional items here
}

function onCreatureAppear(cid)
  -- Do nothing on appearance
end

function onCreatureDisappear(cid)
  npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
  if not npcHandler:isFocused(cid) then
    npcHandler:focus(cid)
    npcHandler:say("Greetings, adventurer! How may I help you today?", cid)
  else
    if msg:lower() == "offer" then
      local itemList = "Today's stock:\n\n"
      for i, item in ipairs(shopItems) do
        itemList = itemList .. item.sell .. " gold for " .. getItemNameById(item.itemid) .. "\n"
      end
      npcHandler:say(itemList, cid)
    end
  end
end

function onThink()
  npcHandler:onThink()
end

npcHandler:addModule(FocusModule:new())



local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
  -- Do nothing on appearance
end

function onCreatureDisappear(cid)
  npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
  if npcHandler and not npcHandler:isFocused(cid) then
    npcHandler:focus(cid)
    npcHandler:say("Greetings, adventurer! How may I help you today?", cid)
  else
    if msg:lower() == "offer" then
      npcHandler:say("Here's what I have in stock today:", cid)
      npcHandler:say("Item 1", cid) -- Replace with the name of your first item
      npcHandler:say("Item 2", cid) -- Replace with the name of your second item
      npcHandler:say("Item 3", cid) -- Replace with the name of your third item
      -- Add additional items here as needed
    end
  end
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local items = {
		[PlayerStorageKeys.firstWand] = 2190,
		[PlayerStorageKeys.firstRod] = 2182,
		[PlayerStorageKeys.firstCrossbow] = 2455
	}

	if msgcontains(msg, 'first') then
		local storage = nil
		local itemName = ""

		if msgcontains(msg, 'shovel') then
			storage = PlayerStorageKeys.firstWand
			itemName = ItemType(items[storage]):getName()
		elseif msgcontains(msg, 'rope') then
			storage = PlayerStorageKeys.firstRod
			itemName = ItemType(items[storage]):getName()
		elseif msgcontains(msg, 'pick') then
			storage = PlayerStorageKeys.firstCrossbow
			itemName = ItemType(items[storage]):getName()
		end

		if storage ~= nil then
			if player:getStorageValue(storage) == -1 then
				selfSay('So you ask me for a {' .. itemName .. '} to begin your adventure?', cid)
				npcHandler.topic[cid] = storage
			else
				selfSay('What? I have already gave you one {' .. itemName .. '}!', cid)
			end
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] ~= nil then
			player:addItem(items[npcHandler.topic[cid]], 1)
			selfSay('Here you are young adept, take care yourself.', cid)
			player:setStorageValue(npcHandler.topic[cid], 1)
		end
		npcHandler.topic[cid] = nil
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] ~= nil then
		selfSay('Ok then.', cid)
		npcHandler.topic[cid] = nil
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

return npcHandler


function onThink()
  npcHandler:onThink()
end

npcHandler:addModule(FocusModule:new())