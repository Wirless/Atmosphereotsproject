

function onUse(cid, item, fromPosition, itemEx, toPosition)
    if itemEx.actionid == 7942 then
        local chance = math.random(1, 100)
        local newItem = 0
        
        if chance <= 1 then -- 1% chance for HIGH tier item
            local highTierItems =  {2343, 2466, 2469, 2470, 2471, 2472, 2474, 2493, 2494, 2495, 2496, 2498, 2499, 2500, 2501, 2502, 2503, 2504, 2505, 2506, 2507, 2514, 2520, 2522, 2523, 2539, 2644, 2645, 2646, 2653, 2655, 2659, 2664, 2665, 3967, 3968, 3969, 3970, 3971, 3972, 3973, 3974, 3975, 3982, 3983} 
            newItem = highTierItems[math.random(#highTierItems)]
            doSendMagicEffect(toPosition, 20) -- magic effect id for HIGH tier
        elseif chance <= 3 then -- 2% chance for MID tier item
            local midTierItems =  {2195, 2463, 2475, 2476, 2477, 2483, 2487, 2488, 2489, 2490, 2491, 2492, 2497, 2515, 2516, 2517, 2518, 2519, 2527, 2528, 2529, 2534, 2535, 2536, 2537, 2538, 2542, 2647, 2656, 2660, 2661, 2662, 2663} 
            newItem = midTierItems[math.random(#midTierItems)]
            doSendMagicEffect(toPosition, 21) -- magic effect id for MID tier
        elseif chance <= 13 then -- 10% chance for LOW tier item
            local lowTierItems =  {2457,2458,2459,2460,2461,2462, 2464, 2465, 2467, 2468, 2473, 2478, 2479, 2480, 2481, 2482, 2484, 2485, 2486, 2508, 2510, 2511, 2512, 2513, 2521, 2524, 2525, 2526, 2530, 2531, 2532, 2533, 2540, 2541, 2642, 2643, 2648, 2649, 2650, 2651, 2652, 2654, 2657, 2658 } 
            newItem = lowTierItems[math.random(#lowTierItems)]
            doSendMagicEffect(toPosition, 22) -- magic effect id for LOW tier
        else -- 84% chance for wooden trash item
            newItem = 2250
        end
        
        doSendMagicEffect(toPosition, CONST_ME_POFF)
        doRemoveItem(itemEx.uid)
        doCreateItem(newItem, 1, toPosition)
    end
    
    return true
end
