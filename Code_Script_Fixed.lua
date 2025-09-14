local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "UnghiaScript",
    SubTitle = "by UnghiaTool",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Tabs
local Main = Window:AddTab({ Title = "Main", Icon = "sword" })
local ESPTab = Window:AddTab({ Title = "ESP", Icon = "eye" })
local ServerTab = Window:AddTab({ Title = "Server", Icon = "server" })

-- Options
local Options = Fluent.Options

-- Main Tab
Main:AddToggle("AutoFarm", {
    Title = "Auto Farm",
    Default = false,
    Callback = function(Value)
        _G.AutoFarm = Value
    end
})

-- ESP Tab
ESPTab:AddToggle("IslandESP", {
    Title = "Island ESP",
    Default = false,
    Callback = function(Value)
        IslandESP = Value
    end
})

ESPTab:AddToggle("PlayerESP", {
    Title = "Player ESP",
    Default = false,
    Callback = function(Value)
        ESPPlayer = Value
    end
})

ESPTab:AddToggle("ChestESP", {
    Title = "Chest ESP",
    Default = false,
    Callback = function(Value)
        ChestESP = Value
    end
})

ESPTab:AddToggle("DevilFruitESP", {
    Title = "Devil Fruit ESP",
    Default = false,
    Callback = function(Value)
        DevilFruitESP = Value
    end
})

-- Server Tab
ServerTab:AddButton({
    Title = "Server Hop",
    Description = "Chuyển server ngẫu nhiên",
    Callback = function()
        Hop()
    end
})

-- Vòng lặp update ESP liên tục
task.spawn(function()
    while task.wait(1) do
        if IslandESP then UpdateIslandESP() end
        if ESPPlayer then UpdatePlayerChams() end
        if ChestESP then UpdateChestChams() end
        if DevilFruitESP then UpdateDevilChams() end
        if FlowerESP then UpdateFlowerChams() end
        if RealFruitESP then UpdateRealFruitChams() end
    end
end)
