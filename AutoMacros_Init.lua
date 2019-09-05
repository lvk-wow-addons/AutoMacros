function AutoMacros_InitTables(settings)
    settings["food"] = {
        [4656] = { 0, 61 }, -- Small Pumpkin
        [6303] = { 0, 30 }, -- Raw Slitherskin Mackerel
        [2070] = { 0, 61 }, -- Darnassian Bleu
        [4540] = { 0, 61 }, -- Tough Hunk of Bread
        [117] = { 0, 61 }, -- Tough Jerky
        [1326] = { 0, 243 }, -- Sauteed Sunfish
        [6291] = { 0, 30 }, -- Raw Brilliant Smallfish
        [2681] = { 0, 61 }, -- Roasted Boar Meat (crafted)
        [2679] = { 0, 61 }, -- Charred Wolf Meat (crafted)
        [787] = { 0, 61 }, -- Slitherskin Mackerel
        [4536] = { 0, 61 }, -- Shiny Red Apple
        [4604] = { 0, 61 }, -- Forest Mushroom Cap

        [4541] = { 5, 243 }, -- Freshly Baked Bread
        [2287] = { 5, 243 }, -- Haunch of Meat
        [414] = { 5, 243 }, -- Dalaran Sharp
        [4592] = { 5, 243 }, -- Longjaw Mud Snapper
        [4537] = { 5, 243 }, -- Tel'Abim Banana
        [4605] = { 5, 243 }, -- Red-speckled Mushroom

        [4542] = { 15, 552 }, -- Moist Cornbread
        [3770] = { 15, 552 }, -- Mutton Chop
        [422] = { 15, 552 }, -- Dwarven Mild
        [4593] = { 15, 552 }, -- Bristle Whisker Catfish
        [4538] = { 15, 552 }, -- Snapvine Watermelon
        [4606] = { 15, 552 }, -- Spongy Morel

        [4544] = { 25, 874 }, -- Mulgore Spice Bread
        [3771] = { 25, 874 }, -- Wild Hog Shank
        [1707] = { 25, 874 }, -- Stormwind Brie
        [4594] = { 25, 874 }, -- Rockscale Cod
        [4539] = { 25, 874 }, -- Goldenbark Apple
        [4607] = { 25, 874 }, -- Delicious Cave Mold

        [4601] = { 35, 1392 }, -- Soft Banana Bread
        [4599] = { 35, 1392 }, -- Cured Ham Steak
        [3927] = { 35, 1392 }, -- Fine Aged Cheddar
        [21552] = { 35, 1392 }, -- Striped Yellowtail
        [4602] = { 35, 1392 }, -- Moon Harvest Pumpkin
        [4608] = { 35, 1392 }, -- Raw Black Truffle

        [8950] = { 45, 2148 }, -- Homemade Cherry Pie
        [8952] = { 45, 2148 }, -- Roasted Quail
        [8932] = { 45, 2148 }, -- Alterac Swiss
        [8957] = { 45, 2148 }, -- Spinefin Halibut
        [8953] = { 45, 2148 }, -- Deep Fried Plantains
        [8948] = { 45, 2148 }, -- Dried King Bolete
    }
    settings["specialFood"] = {
        [2680] = { 0, 61 }, -- Spiced Wolf Meat
        [6888] = { 0, 61 }, -- Herb Baked Egg (crafted)

        [5525] = { 5, 243 }, -- Boiled Clams

        [21099] = { 10, 378 }, -- Smoked Sagefish

        [21219] = { 30, 840 }, -- Sagefish Delight
    }
    settings["drink"] = {
        [159] = { 0, 151 }, -- Refreshing Spring Water
        [5350] = { 0, 152 }, -- Conjured Water
        
        [1179] = { 5, 436 }, -- Ice Cold Milk
        [2288] = { 5, 437 }, -- Conjured Fresh Water

        [1205] = { 15, 835 }, -- Melon Juice
        [2136] = { 15, 836 }, -- Conjured Purified Water
        
        [1708] = { 25, 1344 }, -- Sweet Nectar
        [3772] = { 25, 1345 }, -- Conjured Spring Water
        
        [1645] = { 35, 1992 }, -- Moonberry Juice
        [19300] = { 35, 1992 }, -- Bottled Winterspring Water
        [8077] = { 35, 1993 }, -- Conjured Mineral Water
        
        [8766] = { 45, 2934 }, -- Morning Glory Dew
        [8078] = { 45, 2935 }, -- Conjured Sparkling Water

        [8079] = { 55, 4200 }, -- Conjured Crystal Water
    }
    settings["specialDrink"] = {
    }
    settings["healingPotion"] = {
        [118] = { 0, 90 }, -- Minor Healing Potion
        [858] = { 3, 180 }, -- Lesser Healing Potion
        [929] = { 12, 360 }, -- Healing Potion
        [1710] = { 21, 585 }, -- Greater Healing Potion
        [3928] = { 35, 900 }, -- Superior Healing Potion
    }
    settings["manaPotion"] = {
        [2455] = { 0, 180 }, -- Minor Mana Potion
        [3385] = { 14, 360 }, -- Lesser Mana Potion
        [3827] = { 22, 585 }, -- Mana Potion
        [6149] = { 31, 900 }, -- Greater Mana Potion
    }
    settings["specialPotion"] = {
        [1322] = { 0, 10 }
    }
end