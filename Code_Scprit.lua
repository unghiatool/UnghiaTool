-- Code_Scprit.lua
-- Unghia Tool V1 - Custom UI Tabs (No OrionLib)

-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UnghiaUI"
ScreenGui.Parent = game.CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 320)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "Unghia Tool V1"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.Parent = MainFrame

-- Tab Buttons Frame
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(0, 120, 1, -40)
TabFrame.Position = UDim2.new(0, 0, 0, 40)
TabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabFrame.Parent = MainFrame

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -120, 1, -40)
ContentFrame.Position = UDim2.new(0, 120, 0, 40)
ContentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ContentFrame.Parent = MainFrame

-- Helper để tạo page
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
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    btn.Parent = TabFrame
    btn.MouseButton1Click:Connect(function()
        for n,p in pairs(Pages) do p.Visible = false end
        Pages[name].Visible = true
    end)
    return btn
end

-- Helper để tạo toggle button
local function CreateToggle(page, text, order, default, callback)
    local state = default or false
    local btn = Instance.new("TextButton")
    btn.Text = text .. ": " .. (state and "ON" or "OFF")
    btn.Size = UDim2.new(1,-20,0,35)
    btn.Position = UDim2.new(0,10,0,10+(order*45))
    btn.BackgroundColor3 = Color3.fromRGB(80,80,80)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18
    btn.Parent = page
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. ": " .. (state and "ON" or "OFF")
        callback(state)
    end)
    return btn
end

-- Helper để tạo button thường
local function CreateButton(page, text, order, callback)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Size = UDim2.new(1,-20,0,35)
    btn.Position = UDim2.new(0,10,0,10+(order*45))
    btn.BackgroundColor3 = Color3.fromRGB(100,80,80)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18
    btn.Parent = page
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Tạo các Page
local MainPage = CreatePage("Main")
local ESPPage = CreatePage("ESP")
local ServerPage = CreatePage("Server")

-- Tạo Tab Buttons
CreateTabButton("Main",0)
CreateTabButton("ESP",1)
CreateTabButton("Server",2)

-- Main Tab Toggles
CreateToggle(MainPage,"Auto Farm",0,false,function(v) _G.AutoFarm = v end)

-- ESP Tab Toggles
CreateToggle(ESPPage,"Island ESP",0,false,function(v) IslandESP = v end)
CreateToggle(ESPPage,"Player ESP",1,false,function(v) ESPPlayer = v end)
CreateToggle(ESPPage,"Chest ESP",2,false,function(v) ChestESP = v end)
CreateToggle(ESPPage,"Devil Fruit ESP",3,false,function(v) DevilFruitESP = v end)

-- Server Tab Button
CreateButton(ServerPage,"Server Hop",0,function() Hop() end)

-- Default mở Main Tab
MainPage.Visible = true

-- =============================================
-- Toàn bộ function gốc (CheckQuest, Hop, UpdateESP, ...)
-- Dán lại toàn bộ các function trong script gốc OrionLib của bạn
-- =============================================
