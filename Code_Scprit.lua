-- Code_Scprit.lua
-- Unghia Tool V1 - UI Fluent Version

-- // Load Fluent
local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/source.lua"))()

-- // Window Setup
local Window = Fluent:CreateWindow({
    Title = "Unghia Tool V1",
    SubTitle = "Fluent UI",
    TabWidth = 120,
    Size = UDim2.fromOffset(580, 350),
    Acrylic = true,
    Theme = "Dark"
})

-- Tabs
local MainTab = Window:AddTab({ Title = "Main", Icon = "rbxassetid://7734053495" })
local ESPTab = Window:AddTab({ Title = "ESP", Icon = "rbxassetid://7734068321" })
local ServerTab = Window:AddTab({ Title = "Server", Icon = "rbxassetid://7734016041" })

-- // Main Tab
local AutoFarmToggle = MainTab:AddToggle("AutoFarm", {
    Title = "Auto Farm",
    Default = false,
    Callback = function(v)
        _G.AutoFarm = v
    end
})

-- // ESP Tab
local IslandESPToggle = ESPTab:AddToggle("IslandESP", {
    Title = "Island ESP",
    Default = false,
    Callback = function(v)
        IslandESP = v
    end
})

local PlayerESPToggle = ESPTab:AddToggle("PlayerESP", {
    Title = "Player ESP",
    Default = false,
    Callback = function(v)
        ESPPlayer = v
    end
})

local ChestESPToggle = ESPTab:AddToggle("ChestESP", {
    Title = "Chest ESP",
    Default = false,
    Callback = function(v)
        ChestESP = v
    end
})

local FruitESPToggle = ESPTab:AddToggle("FruitESP", {
    Title = "Devil Fruit ESP",
    Default = false,
    Callback = function(v)
        DevilFruitESP = v
    end
})

-- // Server Tab
local ServerHopBtn = ServerTab:AddButton({
    Title = "Server Hop",
    Description = "Teleport to another server",
    Callback = function()
        Hop()
    end
})

-- // Notifications
Fluent:Notify({
    Title = "Unghia Tool V1",
    Content = "Loaded with Fluent UI!",
    Duration = 5
})

-- =============================================
-- Toàn bộ function gốc (CheckQuest, Hop, UpdateESP, ...)
-- Dán lại toàn bộ các function trong script OrionLib của bạn
-- =============================================
