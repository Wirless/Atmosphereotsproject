function onEquip(cid, item, slot, isHotkey)
  if slot == CONST_SLOT_ARMOR then
    local armorId = getPlayerSlotItem(cid, CONST_SLOT_ARMOR).itemid
    -- Check if the armor is the one that triggers the outfit change
    if armorId == 2659 then
      -- Change the player's outfit
      doSetCreatureOutfit(cid, 150, -1)
    end
  end
end

function onDeEquip(cid, item, slot, isHotkey)
  if slot == CONST_SLOT_ARMOR then
    local armorId = getPlayerSlotItem(cid, CONST_SLOT_ARMOR).itemid
    -- Check if the armor is the one that triggers the outfit change
    if armorId == 2659 then
      -- Change the player's outfit
      doSetCreatureOutfit(cid, 151, -1)
    end
  end
end