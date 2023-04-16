local ITEM_CHANCE = 10 -- 10% chance to get an item

local ITEM_TABLE = { 
    {itemID = 2148, minCount = 1, maxCount = 5}, -- gold coin, 1-5 pieces
    {itemID = 2152, minCount = 1, maxCount = 3}, -- platinum, 1 piece
    {itemID = 2150, minCount = 1, maxCount = 2}  -- small ruby, 1-2 pieces
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if target.itemid ~= 0 then
        return false -- make sure the target is a container
    end
    
    if math.random(1, 100) <= ITEM_CHANCE then
        local randomItem = ITEM_TABLE[math.random(1, #ITEM_TABLE)]
        local itemCount = math.random(randomItem.minCount, randomItem.maxCount)
        local itemToAdd = Item(randomItem.itemID, itemCount)
        target:addItemEx(itemToAdd)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "You found " .. itemCount .. "x " .. itemToAdd:getName() .. " in the container!")
    else
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "The container is empty.")
    end
    
    return true
end
