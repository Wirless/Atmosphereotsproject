local grapePositions = { -- replace with a table of positions where the grapes can spawn
    {x = 993, y = 995, z = 6},
    {x = 994, y = 995, z = 6},
    {x = 995, y = 995, z = 6},
    {x = 996, y = 995, z = 6},
	{x = 992, y = 996, z = 6},
	{x = 992, y = 997, z = 6},
	{x = 992, y = 998, z = 6},
	{x = 993, y = 999, z = 6},
	{x = 994, y = 1000, z = 6},
	{x = 995, y = 1000, z = 6},
	{x = 994, y = 997, z = 6},
	{x = 995, y = 997, z = 6},
	{x = 996, y = 997, z = 6},
	{x = 1028, y = 1006, z = 6},
	{x = 1029, y = 1007, z = 6},
	{x = 1029, y = 1008, z = 6},
	{x = 1029, y = 1009, z = 6},
	{x = 1029, y = 1010, z = 6},
	{x = 1029, y = 1011, z = 6},
	{x = 1029, y = 1012, z = 6},
	{x = 1027, y = 1010, z = 6},
	{x = 1027, y = 1009, z = 6},
	{x = 1026, y = 1009, z = 6},
	{x = 1024, y = 1002, z = 5},
	{x = 1021, y = 1001, z = 5},
	{x = 1022, y = 1001, z = 5},
	{x = 1023, y = 1001, z = 5},
	{x = 1024, y = 1001, z = 5},
	{x = 1020, y = 1002, z = 5},
	{x = 1020, y = 1003, z = 5},
	{x = 1020, y = 1004, z = 5},
	{x = 1021, y = 1005, z = 5},
	{x = 1022, y = 1006, z = 5},
	{x = 1023, y = 1006, z = 5},
	{x = 1024, y = 1006, z = 5},
}

function onThink(interval)
    local grapePosition = grapePositions[math.random(1, #grapePositions)] -- get a random grape position from the table
    Game.createItem(2681, 1, grapePosition) -- create a grape at the chosen position
    return true
end

--local interval = 5 * 1000 -- interval in milliseconds (5 seconds)
--Game.createEvent("GrapeSpawnEvent", interval, -1, onThink)