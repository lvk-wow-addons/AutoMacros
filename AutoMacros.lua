AutoMacros = {
    ["inventoryChangedDuringCombat"] = false,
    ["lastStatus"] = {
        ["healingPotion"] = false,
        ["manaPotion"] = false,
        ["food"] = false,
        ["drink"] = false
    }
}

function AutoMacros:InventoryChanged()
    if UnitAffectingCombat("player") then
        self.inventoryChangedDuringCombat = true
    else
        self.inventoryChangedDuringCombat = false
        self:UpdateMacro("food", self.GetFoodMacro, function()
            self.lastStatus.food = false
            self.lastStatus.healingPotion = false
        end)
        self:UpdateMacro("drink", self.GetDrinkMacro, function()
            self.lastStatus.drink = false
            self.lastStatus.manaPotion = false
        end)
    end
end

function AutoMacros:UpdateMacro(id, fnGetMacro, fnNoMacro)
    local index = self:GetMacroIndex(id)
    if not index then
        LVK:Debug("unable to find macro with id '" .. id .. "'")
        fnNoMacro()
        return
    end

    local body = self:AssembleMacro(id, fnGetMacro(self))
    -- print("changing macro #" .. index .. " to " .. body)
    EditMacro(index, nil, nil, body, 1)
end

function AutoMacros:AssembleMacro(id, body)
    if not body or #body == 0 then
        return "#showtooltip"
    end

    local idLine = "/run --" .. id .. "\n"
    local result = ""
    local first = true
    for k, v in ipairs(body) do
        if first and not string.match(v, "#showtooltip") then
            result = result .. idLine
            first = false
        end
        result = result .. v .. "\n"
    end

    if first then
        result = result .. idLine
    end

    return result
end

function AutoMacros:GetMacroIndex(id)
    local search = "--" .. id
    for index=1, 138 do
        local name, _, body = GetMacroInfo(index)
        if name then
            if string.match(body, search) then
                return index
            end
        end
    end

    return nil
end

function AutoMacros:BuildItemUseMacro(options)
    local result = ""

    self.last = options

    for k, v in ipairs(options) do
        local mod = v[1]
        local item = v[2]
        if item then
            if result ~= "" then
                result = result .. "; "
            end
            if mod ~= "" then
                result = result .. "[" .. mod .. "]"
            end
            result = result .. item
        end
    end

    LVK:Debug("use: " .. (result or "nothing"))
    if result == "" then
        return {
            "#showtooltip"
        }
    end

    return {
        "#showtooltip",
        "/use " .. result
    }
end

function AutoMacros:GetFoodMacro()
    local food = self:GetBestItem(self.food)
    local specialFood = self:GetBestItem(self.specialFood)
    local pot = self:GetBestItem(self.healingPotion)
    local specialPot = self:GetBestItem(self.specialPotion)

    self.lastStatus.food = food ~= nil
    self.lastStatus.healingPotion = pot ~= nil

    return self:BuildItemUseMacro({
        { "nocombat,mod:shift", pot },
        { "nocombat,mod:ctrl", specialFood },
        { "nocombat", food },
        { "combat,mod:shift", specialPot },
        { "combat", pot },
    })
end

function AutoMacros:GetDrinkMacro()
    local drink = self:GetBestItem(self.drink)
    local specialDrink = self:GetBestItem(self.specialDrink)
    local pot = self:GetBestItem(self.manaPotion)
    local specialPot = self:GetBestItem(self.specialPotion)

    self.lastStatus.drink = drink ~= nil
    self.lastStatus.manaPotion = pot ~= nil

    return self:BuildItemUseMacro({
        { "nocombat,mod:shift", pot },
        { "nocombat,mod:ctrl", specialDrink },
        { "nocombat", drink },
        { "combat,mod:shift", specialPot },
        { "combat", pot },
    })
end

function AutoMacros:GetBestItem(tbl)
    local best = nil
    local bestValue = 0
    local maxLevel = UnitLevel("player")

    for bag = 0, 4 do
        for slot = 1, GetContainerNumSlots(bag) do
            local item = GetContainerItemLink(bag, slot)
            local itemId = LVK:GetItemId(item)

            if itemId then
                local values = tbl[itemId]
                if values then
                    local level = values[1]
                    local value = values[2]
                    if level <= maxLevel and value > bestValue then
                        local name = string.match(item, "%[(.*)%]")
                        best = name
                        bestValue = value
                    end
                end
            end
        end
    end

    return best
end

function AutoMacros:PlayerLeftCombat()
    if self.inventoryChangedDuringCombat then
        self.inventoryChangedDuringCombat = false
        self:InventoryChanged()
    end
end

function AutoMacros:SetMode(mode)
    if mode == 1 then
        -- dps
        AutoMacros:RebuildModeMacros(function(name,lines)
            if name == "Shoot" then
                return {
                    "#showtooltip 18",
                    "//auto",
                    "/targetenemy [dead][noexists][noharm]",
                    "/cast !Shoot"
                }
            else
                local result = {}
                for k, v in ipairs(lines) do
                    if v:sub(1, 13) == "//targetenemy" or v:sub(1, 13) == "//startattack" then
                        v = v:sub(2)
                    end
                    table.insert(result, v)
                end
                return result
            end
        end)
    else
        -- healer
        AutoMacros:RebuildModeMacros(function(name,lines)
            if name == "Shoot" then
                return {
                    "#showtooltip 18",
                    "//auto",
                    "/cast [@mouseover,harm,nodead][@target,harm,nodead][] !Shoot"
                }
            else
                local result = {}
                for k, v in ipairs(lines) do
                    if v:sub(1, 12) == "/targetenemy" or v:sub(1, 12) == "/startattack" then
                        v = "/" .. v
                    end
                    table.insert(result, v)
                end
                return result
            end
        end)
    end
end

function AutoMacros:RebuildModeMacros(fn)
    local search = "//auto"
    for index=1, 138 do
        local name, _, body = GetMacroInfo(index)
        if name then
            if string.match(body, search) then
                local lines = LVK:SplitLines(body)
                newLines = fn(name, lines)
                if newLines then
                    -- print("updating " .. name .. " to:")
                    body = LVK:AssembleLines(newLines)
                    -- print(body)
                    EditMacro(index, nil, nil, body, 1)
                end
            end
        end
    end
end

function AutoMacros:SplitMacroBody(body)
    local lines = {}
    for line in body:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end
    return lines
end

local frame = CreateFrame("frame")
frame:RegisterEvent("BAG_UPDATE")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_LEAVE_COMBAT")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
local function frameEventHandler(self, event, ...)
    if event == "BAG_UPDATE" or event == "PLAYER_ENTERING_WORLD" then
        AutoMacros:InventoryChanged()
    end
    if event == "PLAYER_LEAVE_COMBAT" or event == "PLAYER_REGEN_ENABLED" then
        AutoMacros:PlayerLeftCombat()
    end
end
frame:SetScript("OnEvent", frameEventHandler)

AutoMacros_InitTables(AutoMacros)
LVK:AnnounceAddon("AutoMacros")