-- keep it ordered
local invalidTypes = {
	
	479, 480, 481, 482, 483, 484, 485, 501, 518, 519, 520, 524, 525, 536, 543,
	549, 576, 581, 582, 597, 616, 623, 625, 638, 639, 640, 641, 642, 643, 645,
	646, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 678, 700,
	701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 711, 713, 715, 718, 719,
	722, 723, 737, 741, 742, 743, 744, 748, 751, 752, 753, 754, 755, 756, 757,
	758, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777,
	778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792,
	793, 794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804, 805, 806, 807,
	808, 809, 810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822,
	823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837,
	838, 839, 840, 841, 847, 864, 865, 866, 867, 871, 872, 880, 891, 892, 893,
	894, 895, 896, 897, 898
}

function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	local lookType = tonumber(param)
	if lookType >= 0 and lookType < 903 and not table.contains(invalidTypes, lookType) then
		local playerOutfit = player:getOutfit()
		playerOutfit.lookType = lookType
		player:setOutfit(playerOutfit)
	else
		player:sendCancelMessage("A look type with that id does not exist.")
	end
	return false
end
