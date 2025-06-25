local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YoranHUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local FloatingButton = Instance.new("TextButton")
FloatingButton.Name = "FloatingButton"
FloatingButton.Size = UDim2.new(0, 50, 0, 50)
FloatingButton.Position = UDim2.new(0, 20, 0.5, -25)
FloatingButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
FloatingButton.Text = "☰"
FloatingButton.TextColor3 = Color3.new(1, 1, 1)
FloatingButton.TextSize = 20
FloatingButton.Font = Enum.Font.SourceSansBold
FloatingButton.ZIndex = 2
FloatingButton.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.3, 0)
UICorner.Parent = FloatingButton

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Position = UDim2.new(0, 80, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0.05, 0)
FrameCorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Position = UDim2.new(0, 0, 0, 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "悠然独家脚本"
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.TextSize = 20
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = MainFrame

local TitlePadding = Instance.new("UIPadding")
TitlePadding.PaddingLeft = UDim.new(0, 15)
TitlePadding.Parent = TitleLabel

local function CreateButton(name, positionY, scriptToRun)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Size = UDim2.new(0.9, 0, 0, 45)
    Button.Position = UDim2.new(0.05, 0, positionY, 0)
    Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.Text = name
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 18
    Button.Parent = MainFrame
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0.1, 0)
    ButtonCorner.Parent = Button
    
    Button.MouseButton1Click:Connect(function()
        if scriptToRun then
            scriptToRun()
        end
    end)
    
    return Button
end

CreateButton("人物控制", 0.2, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/-QY/Main/Ohio"))()
end)

CreateButton("阿尔宙斯自瞄", 0.4, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
end)

CreateButton("iy指令", 0.6, function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'), true))()
end)

local isUIVisible = false
FloatingButton.MouseButton1Click:Connect(function()
    isUIVisible = not isUIVisible
    MainFrame.Visible = isUIVisible
    FloatingButton.TextSize = 18
    wait(0.1)
    FloatingButton.TextSize = 20
end)

spawn(function()
    while true do
        for i = 1, 50 do
            FloatingButton.Position = UDim2.new(0, 20, 0.5, -25 + math.sin(i/10) * 5)
            wait(0.05)
        end
    end
end)
