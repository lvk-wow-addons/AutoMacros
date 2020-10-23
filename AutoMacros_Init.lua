function AutoMacros_InitTables(settings)
    settings["food"] = {
        [4656] = { 0, 180 }, -- Small Pumpkin
        [6303] = { 0, 150 }, -- Raw Slitherskin Mackerel
        [2070] = { 0, 180 }, -- Darnassian Bleu
        [4540] = { 0, 180 }, -- Tough Hunk of Bread
        [117] = { 0, 180 }, -- Tough Jerky
        [1326] = { 0, 210 }, -- Sauteed Sunfish
        [6291] = { 0, 150 }, -- Raw Brilliant Smallfish
        [2681] = { 0, 180 }, -- Roasted Boar Meat (crafted)
        [2679] = { 0, 180 }, -- Charred Wolf Meat (crafted)
        [787] = { 0, 180 }, -- Slitherskin Mackerel
        [4536] = { 0, 180 }, -- Shiny Red Apple
        [4604] = { 0, 180 }, -- Forest Mushroom Cap

        [4541] = { 3, 210 }, -- Freshly Baked Bread
        [2287] = { 3, 210 }, -- Haunch of Meat
        [414] = { 3, 210 }, -- Dalaran Sharp
        [4592] = { 3, 210 }, -- Longjaw Mud Snapper
        [4537] = { 3, 210 }, -- Tel'Abim Banana
        [4605] = { 3, 210 }, -- Red-speckled Mushroom

        [4542] = { 7, 240 }, -- Moist Cornbread
        [3770] = { 7, 240 }, -- Mutton Chop
        [422] = { 7, 240 }, -- Dwarven Mild
        [4593] = { 7, 240 }, -- Bristle Whisker Catfish
        [4538] = { 7, 240 }, -- Snapvine Watermelon
        [4606] = { 7, 240 }, -- Spongy Morel

        [4544] = { 11, 375 }, -- Mulgore Spice Bread
        [3771] = { 11, 375 }, -- Wild Hog Shank
        [1707] = { 11, 375 }, -- Stormwind Brie
        [4594] = { 11, 375 }, -- Rockscale Cod
        [4539] = { 11, 375 }, -- Goldenbark Apple
        [4607] = { 11, 375 }, -- Delicious Cave Mold

        [4601] = { 15, 978 }, -- Soft Banana Bread
        [4599] = { 15, 978 }, -- Cured Ham Steak
        [3927] = { 15, 978 }, -- Fine Aged Cheddar
        [21552] = { 15, 978 }, -- Striped Yellowtail
        [4602] = { 15, 978 }, -- Moon Harvest Pumpkin
        [4608] = { 15, 978 }, -- Raw Black Truffle

        [8950] = { 20, 1500 }, -- Homemade Cherry Pie
        [8952] = { 20, 1500 }, -- Roasted Quail
        [8932] = { 20, 1500 }, -- Alterac Swiss
        [8957] = { 20, 1500 }, -- Spinefin Halibut
        [8953] = { 20, 1500 }, -- Deep Fried Plantains
        [8948] = { 20, 1500 }, -- Dried King Bolete

        [80610] = { 35, 1000000000 }, -- Conjured Mana Pudding
    }
    settings["specialFood"] = {
        [2680] = { 0, 180 }, -- Spiced Wolf Meat
        [6888] = { 0, 180 }, -- Herb Baked Egg (crafted)

        [5525] = { 3, 210 }, -- Boiled Clams

        [21072] = { 5, 15750 }, -- Smoked Sagefish

        [21217] = { 13, 9135 }, -- Sagefish Delight
    }
    settings["drink"] = {
        [159] = { 0, 180 }, -- Refreshing Spring Water
        [5350] = { 0, 180 }, -- Conjured Water
        
        [1179] = { 3, 504 }, -- Ice Cold Milk
        [8079] = { 23, 2160 }, -- Conjured Fresh Water

        [8078] = { 20, 900 }, -- Conjured Sparkling Water

        [1205] = { 7, 288 }, -- Melon Juice
        [2136] = { 7, 288 }, -- Conjured Purified Water
        
        [1708] = { 11, 324 }, -- Sweet Nectar
        [3772] = { 11, 324 }, -- Conjured Spring Water
        
        [1645] = { 15, 588 }, -- Moonberry Juice
        [19300] = { 15, 588 }, -- Bottled Winterspring Water
        [8077] = { 15, 588 }, -- Conjured Mineral Water
        
        [8766] = { 20, 900 }, -- Morning Glory Dew

        [8079] = { 23, 2160 }, -- Conjured Crystal Water

        [80610] = { 35, 1000000000 }, -- Conjured Mana Pudding
    }
    settings["specialDrink"] = {
    }
    settings["healingPotion"] = {
        [118] = { 3, 80 }, -- Minor Healing Potion
        [858] = { 6, 110 }, -- Lesser Healing Potion
        [929] = { 10, 68 }, -- Healing Potion
        [1710] = { 13, 68 }, -- Greater Healing Potion
        [3928] = { 20, 104 }, -- Superior Healing Potion
        [152494] = { 40, 3546 }, -- Coastal Healing Potion
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