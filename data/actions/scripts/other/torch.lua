function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	
	local itemId = item:getId()
	if itemId == 2050 then
	item:transform(2051)
	return true
	end
	
end
