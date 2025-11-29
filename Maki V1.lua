-- 📌 MAKI SCRIPT (Final LocalScript, Delta Mobile Compatible)
-- MADE BY MAKI (Enhanced Black UI Version)

--// Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-----------------------------------------------------
--// LOADER (FULL SCREEN, CENTERED, FADE-IN)
-----------------------------------------------------
local LoaderGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
LoaderGui.Name = "MAKI_LOADER"

local LoaderFrame = Instance.new("Frame", LoaderGui)
LoaderFrame.Size = UDim2.new(1,0,1,0)
LoaderFrame.Position = UDim2.new(0,0,0,0)
LoaderFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
LoaderFrame.BackgroundTransparency = 1

-- Centered Image in Loader
local LoaderImage = Instance.new("ImageLabel", LoaderFrame)
LoaderImage.Size = UDim2.new(0.6,0,0.6,0)
LoaderImage.Position = UDim2.new(0.5,0,0.5,0)
LoaderImage.AnchorPoint = Vector2.new(0.5,0.5)
LoaderImage.BackgroundTransparency = 1
LoaderImage.Image = "rbxassetid://111903580087627"
LoaderImage.ScaleType = Enum.ScaleType.Fit
LoaderImage.ImageTransparency = 1

-- Loader Text
local LoaderText = Instance.new("TextLabel", LoaderFrame)
LoaderText.Size = UDim2.new(1,0,0,50)
LoaderText.Position = UDim2.new(0,0,0.9,0)
LoaderText.BackgroundTransparency = 1
LoaderText.Text = "Loading Maki V1..."
LoaderText.Font = Enum.Font.GothamBold
LoaderText.TextColor3 = Color3.fromRGB(255,255,255)
LoaderText.TextScaled = true
LoaderText.TextStrokeTransparency = 0.7
LoaderText.TextTransparency = 1

-- Fade-in animation (2.5 sec)
for i = 1,0,-0.02 do
    LoaderFrame.BackgroundTransparency = i
    LoaderImage.ImageTransparency = i
    LoaderText.TextTransparency = i
    task.wait(0.05)
end

task.wait(0.5)
LoaderGui:Destroy()

-----------------------------------------------------
--// KEY SYSTEM WITH CENTERED IMAGE
-----------------------------------------------------
local correctKey = "MAKI ANG GODS KO"
local keyAccepted = false

local KeyGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
KeyGui.Name = "MAKI_KEY_SYSTEM"

local KeyFrame = Instance.new("Frame", KeyGui)
KeyFrame.Size = UDim2.new(0, 500, 0, 400)
KeyFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
KeyFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
KeyFrame.BorderSizePixel = 0

local Corner = Instance.new("UICorner", KeyFrame)
Corner.CornerRadius = UDim.new(0, 16)

-- Centered Image
local KeyImage = Instance.new("ImageLabel", KeyFrame)
KeyImage.Size = UDim2.new(0.8,0,0.6,0)
KeyImage.Position = UDim2.new(0.5,0,0.3,0)
KeyImage.AnchorPoint = Vector2.new(0.5,0.5)
KeyImage.BackgroundTransparency = 1
KeyImage.Image = "rbxassetid://111903580087627"
KeyImage.ScaleType = Enum.ScaleType.Fit

-- Instruction Label
local TextLabel = Instance.new("TextLabel", KeyFrame)
TextLabel.Size = UDim2.new(1, -20, 0, 30)
TextLabel.Position = UDim2.new(0,10,0,270)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "Enter Key to Access Maki V1"
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextColor3 = Color3.fromRGB(255,255,255)
TextLabel.TextSize = 20

-- TextBox
local TextBox = Instance.new("TextBox", KeyFrame)
TextBox.Size = UDim2.new(1,-20,0,40)
TextBox.Position = UDim2.new(0,10,0,310)
TextBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
TextBox.TextColor3 = Color3.fromRGB(255,255,255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 18
TextBox.ClearTextOnFocus = false
TextBox.PlaceholderText = "Enter Key Here"

local UICornerBox = Instance.new("UICorner", TextBox)
UICornerBox.CornerRadius = UDim.new(0,6)

-- Submit button
local SubmitButton = Instance.new("TextButton", KeyFrame)
SubmitButton.Size = UDim2.new(0,100,0,35)
SubmitButton.Position = UDim2.new(0.5,-50,1,-20)
SubmitButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
SubmitButton.TextColor3 = Color3.fromRGB(255,255,255)
SubmitButton.Text = "Submit"
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.TextSize = 18

local UICornerBtn = Instance.new("UICorner", SubmitButton)
UICornerBtn.CornerRadius = UDim.new(0,6)

-- Key check
SubmitButton.MouseButton1Click:Connect(function()
    if TextBox.Text == correctKey then
        keyAccepted = true
        -- Fade out Key GUI
        for i = 0,1,0.05 do
            KeyFrame.BackgroundTransparency = i
            KeyImage.ImageTransparency = i
            TextLabel.TextTransparency = i
            TextBox.TextTransparency = i
            SubmitButton.TextTransparency = i
            task.wait(0.03)
        end
        KeyGui:Destroy()
    else
        TextLabel.Text = "TANGA KA!"
        TextLabel.TextColor3 = Color3.fromRGB(255,0,0)
    end
end)

-- Wait for correct key
repeat task.wait(0.1) until keyAccepted

-----------------------------------------------------
--// MAIN GUI WITH CENTERED IMAGE INSIDE FRAME
-----------------------------------------------------
local Rayfield = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
Rayfield.Name = "MAKI_MAIN"
Rayfield.ResetOnSpawn = false

-- Main Frame (draggable container)
local MainFrame = Instance.new("Frame", Rayfield)
MainFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
MainFrame.BackgroundTransparency = 0.3
MainFrame.Active = true
MainFrame.Draggable = true

local screenSize = workspace.CurrentCamera.ViewportSize
local desiredWidth = screenSize.X * 0.28
local aspectRatio = 350/420
local desiredHeight = desiredWidth / aspectRatio

MainFrame.Size = UDim2.new(0, desiredWidth, 0, desiredHeight)
MainFrame.Position = UDim2.new(0.5, -desiredWidth/2, 0.5, -desiredHeight/2)

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0,14)

-- Centered Image inside MainFrame
local CenterImage = Instance.new("ImageLabel", MainFrame)
CenterImage.Size = UDim2.new(1,0,1,0)
CenterImage.Position = UDim2.new(0.5,0,0.5,0)
CenterImage.AnchorPoint = Vector2.new(0.5,0.5)
CenterImage.BackgroundTransparency = 1
CenterImage.Image = "rbxassetid://111903580087627"
CenterImage.ScaleType = Enum.ScaleType.Fit

-- Scrollable button container over the image
local ButtonContainer = Instance.new("ScrollingFrame", MainFrame)
ButtonContainer.Size = UDim2.new(1, -20, 1, -80)
ButtonContainer.Position = UDim2.new(0,10,0,70)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.ScrollBarThickness = 5
ButtonContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
ButtonContainer.ScrollingDirection = Enum.ScrollingDirection.Y

local ListLayout = Instance.new("UIListLayout", ButtonContainer)
ListLayout.Padding = UDim.new(0,8)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Button Creator
local function CreateButton(name, callback)
    local Button = Instance.new("TextButton", ButtonContainer)
    Button.Size = UDim2.new(1, 0, 0, 44)
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.BackgroundTransparency = 0.3
    Button.Text = name
    Button.Font = Enum.Font.GothamBold
    Button.TextColor3 = Color3.fromRGB(255,255,255)
    Button.TextSize = 16
    Button.BorderSizePixel = 0

    local corner = Instance.new("UICorner", Button)
    corner.CornerRadius = UDim.new(0,10)

    local Stroke = Instance.new("UIStroke", Button)
    Stroke.Color = Color3.fromRGB(0,0,0)
    Stroke.Transparency = 0.25
    Stroke.Thickness = 1

    Button.MouseButton1Click:Connect(callback)
end

-- HEADER (BLACK)
local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 60)
Header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local HeaderCorner = Instance.new("UICorner", Header)
HeaderCorner.CornerRadius = UDim.new(0, 14)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, 0, 0, 32)
Title.Position = UDim2.new(0, 0, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "Maki V1"
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 24

local Subtitle = Instance.new("TextLabel", Header)
Subtitle.Size = UDim2.new(1, 0, 0, 20)
Subtitle.Position = UDim2.new(0, 0, 0, 33)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "TBC SPAWN TOOLS"
Subtitle.Font = Enum.Font.GothamSemibold
Subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
Subtitle.TextSize = 15

-- Buttons
CreateButton("AYUDA SPAWN UNLI USE", function()
    for _, tool in pairs(ReplicatedStorage:GetChildren()) do
        if tool:IsA("Tool") then
            local clone = tool:Clone()
            clone.Parent = player.Backpack
        end
    end
end)

CreateButton("Combo 3", function()
    local args = {"Combo 3", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

CreateButton("Pill", function()
    local args = {"Pill", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

CreateButton("Oxy", function()
    local args = {"Oxy Pill", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

CreateButton("Normal Pistol", function()
    local args = {"Normal P", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

CreateButton("Pistolbody", function()
    local args = {"PistolBody", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

CreateButton("SharkFang", function()
    local args = {"SharkFang", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

CreateButton("Lockpick", function()
    local args = {"LOCKPICK", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

CreateButton("Glass", function()
    local args = {"Glass", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

CreateButton("Bottle", function()
    local args = {"Bottle", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

CreateButton("Knife", function()
    local args = {"Balistic Knife", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

CreateButton("Blueprint", function()
    local args = {"Blueprint", 1, "RACCMETHOD"}
    ReplicatedStorage:WaitForChild("BuyTbcItemEvent"):FireServer(unpack(args))
end)

-- Toggle Key (Press M)
local GUIVisible = true
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.M then
        GUIVisible = not GUIVisible
        MainFrame.Visible = GUIVisible
    end
end)


