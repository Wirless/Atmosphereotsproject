function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not item:isItem() then
        return true
    end

    local exhaustStorage = 80000001 -- Change this to any unused global storage value
    local exhaustTime = 5 * 60 * 60 -- 5 hours in seconds
    local actionId = KEYID -- Change this to any unused action ID value

    if Game.getStorageValue(exhaustStorage) >= os.time() then
        player:sendCancelMessage("You need to wait before claiming the key.")
        return true
    end

    item:remove()
    Game.createItem(2677, 3, fromPosition)
    Game.setStorageValue(exhaustStorage, os.time() + exhaustTime)
    local key = Game.createItem(2786, 1, fromPosition)
    key:setActionId(actionId)

    return true
end
