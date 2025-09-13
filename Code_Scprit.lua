-- Code_Scprit.lua
-- Unghia Tool V1 - Custom UI Tab Version

-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UnghiaUI"
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "Unghia Tool V1"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.Parent = MainFrame

-- Tab Buttons Frame
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(0, 100, 1, -35)
TabFrame.Position = UDim2.new(0, 0, 0, 35)
TabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabFrame.Parent = MainFrame

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -100, 1, -35)
ContentFrame.Position = UDim2.new(0, 100, 0, 35)
ContentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ContentFrame.Parent = MainFrame

-- Helper để tạo tab page
local Pages = {}
local function CreatePage(name)
    local page = Instance.new("Frame")
    page.Size = UDim2.new(1,0,1,0)
    page.BackgroundTransparency = 1
    page.Visible = false
    page.Parent = ContentFrame
    Pages[name] = page
    return page
end

-- Helper để tạo tab button
local function CreateTabButton(name, order)
    local btn = Instance.new("TextButton")
    btn.Text = name
    btn.Size = UDim2.new(1,0,0,40)
    btn.Position = UDim2.new(0,0,0,order*40)
    btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Parent = TabFrame
    btn.MouseButton1Click:Connect(function()
        for n,p in pairs(Pages) do p.Visible = false end
        Pages[name].Visible = true
    end)
    return btn
end

-- Helper để tạo button trong page
local function CreateButton(page, text, order, callback)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Size = UDim2.new(1,-20,0,35)
    btn.Position = UDim2.new(0,10,0,10+(order*45))
    btn.BackgroundColor3 = Color3.fromRGB(80,80,80)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18
    btn.Parent = page
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Tạo các Page
local FarmPage = CreatePage("Farm")
local ESPPage = CreatePage("ESP")
local MiscPage = CreatePage("Misc")

-- Tạo Tab Buttons
CreateTabButton("Farm",0)
CreateTabButton("ESP",1)
CreateTabButton("Misc",2)

-- Auto Farm Toggle
local autofarm = false
local AutoFarmBtn = CreateButton(FarmPage,"Auto Farm: OFF",0,function()
    autofarm = not autofarm
    AutoFarmBtn.Text = "Auto Farm: " .. (autofarm and "ON" or "OFF")
    _G.AutoFarm = autofarm
end)

-- ESP Toggles
local islandesp=false; local playeresp=false; local chestesp=false; local fruitesp=false

local IslandESPBtn = CreateButton(ESPPage,"Island ESP: OFF",0,function()
    islandesp = not islandesp
    IslandESPBtn.Text = "Island ESP: " .. (islandesp and "ON" or "OFF")
    IslandESP = islandesp
end)
local PlayerESPBtn = CreateButton(ESPPage,"Player ESP: OFF",1,function()
    playeresp = not playeresp
    PlayerESPBtn.Text = "Player ESP: " .. (playeresp and "ON" or "OFF")
    ESPPlayer = playeresp
end)
local ChestESPBtn = CreateButton(ESPPage,"Chest ESP: OFF",2,function()
    chestesp = not chestesp
    ChestESPBtn.Text = "Chest ESP: " .. (chestesp and "ON" or "OFF")
    ChestESP = chestesp
end)
local FruitESPBtn = CreateButton(ESPPage,"Devil Fruit ESP: OFF",3,function()
    fruitesp = not fruitesp
    FruitESPBtn.Text = "Devil Fruit ESP: " .. (fruitesp and "ON" or "OFF")
    DevilFruitESP = fruitesp
end)

-- Misc Functions
local ServerHopBtn = CreateButton(MiscPage,"Server Hop",0,function()
    Hop()
end)

-- =============================================
-- Toàn bộ function gốc (CheckQuest, Hop, UpdateESP, ...)
-- Dán lại toàn bộ các function trong script gốc của bạn ở đây
-- (CheckQuest, Hop, UpdateIslandESP, UpdatePlayerChams, UpdateChestChams, UpdateDevilChams, UpdateFlowerChams...)
-- =============================================

-- Mặc định mở Tab Farm
FarmPage.Visible = true
