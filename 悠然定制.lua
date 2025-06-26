local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YoranHUB"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

local GuiService = game:GetService("GuiService")
local SafeArea = GuiService:GetGuiInset()

local FloatingBall = Instance.new("ImageButton")
FloatingBall.Name = "FloatingBall"
FloatingBall.Size = UDim2.new(0, 60, 0, 60)
FloatingBall.Position = UDim2.new(0, 20 + SafeArea.X, 0.5, -30 + SafeArea.Y/2)
FloatingBall.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
FloatingBall.BackgroundTransparency = 1
FloatingBall.Image = "rbxassetid://117298491487886"
FloatingBall.ZIndex = 10
FloatingBall.Parent = ScreenGui

local BallCorner = Instance.new("UICorner")
BallCorner.CornerRadius = UDim.new(1, 0)
BallCorner.Parent = FloatingBall

local BallGlow = Instance.new("ImageLabel")
BallGlow.Name = "Glow"
BallGlow.Size = UDim2.new(1.5, 0, 1.5, 0)
BallGlow.Position = UDim2.new(-0.25, 0, -0.25, 0)
BallGlow.BackgroundTransparency = 1
BallGlow.Image = "rbxassetid://5028857084"
BallGlow.ImageColor3 = Color3.fromRGB(0, 170, 255)
BallGlow.ScaleType = Enum.ScaleType.Slice
BallGlow.SliceCenter = Rect.new(24, 24, 276, 276)
BallGlow.ZIndex = 9
BallGlow.Parent = FloatingBall

local function GetMobileSafeSize()
    local screenSize = workspace.CurrentCamera.ViewportSize
    local safeWidth = math.min(300, screenSize.X - 40 - SafeArea.X * 2)
    local safeHeight = math.min(500, screenSize.Y - 40 - SafeArea.Y * 2)
    return UDim2.new(0, safeWidth, 0, safeHeight)
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = GetMobileSafeSize()
MainFrame.Position = UDim2.new(0.5, -MainFrame.Size.X.Offset/2, 0.5, -MainFrame.Size.Y.Offset/2 + SafeArea.Y/2)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BackgroundTransparency = 0.1
MainFrame.ClipsDescendants = true
MainFrame.Visible = false
MainFrame.ZIndex = 5
MainFrame.Parent = ScreenGui

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 170, 255)
ScrollingFrame.ZIndex = 6
ScrollingFrame.Parent = MainFrame

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, 0, 1, 0)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ZIndex = 6
ContentFrame.Parent = ScrollingFrame

local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Size = 0
BlurEffect.Parent = MainFrame

local NeonBorder = Instance.new("Frame")
NeonBorder.Name = "NeonBorder"
NeonBorder.Size = UDim2.new(1, 6, 1, 6)
NeonBorder.Position = UDim2.new(-0.03, 0, -0.03, 0)
NeonBorder.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
NeonBorder.BackgroundTransparency = 0.7
NeonBorder.ZIndex = 4
NeonBorder.Parent = MainFrame

local NeonCorner = Instance.new("UICorner")
NeonCorner.CornerRadius = UDim.new(0.1, 0)
NeonCorner.Parent = NeonBorder

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0.1, 0)
FrameCorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -40, 0, 60)
TitleLabel.Position = UDim2.new(0, 20, 0, 10)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "悠 然 牛 逼"
TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
TitleLabel.TextSize = 28
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextStrokeColor3 = Color3.fromRGB(0, 100, 255)
TitleLabel.TextStrokeTransparency = 0.5
TitleLabel.ZIndex = 7
TitleLabel.Parent = ContentFrame

local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Name = "ButtonsFrame"
ButtonsFrame.Size = UDim2.new(1, -40, 0, 0)
ButtonsFrame.Position = UDim2.new(0, 20, 0, 80)
ButtonsFrame.BackgroundTransparency = 1
ButtonsFrame.ZIndex = 7
ButtonsFrame.Parent = ContentFrame

local ButtonsLayout = Instance.new("UIListLayout")
ButtonsLayout.Padding = UDim.new(0, 15)
ButtonsLayout.Parent = ButtonsFrame

local function CreateButton(name, scriptToRun)
    local Button = Instance.new("TextButton")
    Button.Name = name
    Button.Size = UDim2.new(1, 0, 0, 50)
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    Button.BackgroundTransparency = 0.3
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.Text = name
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 18
    Button.ZIndex = 8
    Button.Parent = ButtonsFrame
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0.2, 0)
    ButtonCorner.Parent = Button
    
    local ButtonStroke = Instance.new("UIStroke")
    ButtonStroke.Color = Color3.fromRGB(0, 170, 255)
    ButtonStroke.Thickness = 2
    ButtonStroke.Transparency = 0.7
    ButtonStroke.Parent = Button
    
    Button.MouseButton1Click:Connect(function()
        if scriptToRun then
            scriptToRun()
        end
    end)
    
    return Button
end

CreateButton("人物控制", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/-QY/Main/Ohio"))()
end)

CreateButton("阿尔宙斯自瞄", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()
end)

CreateButton("iy指令", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'), true))()
end)

local function UpdateSizes()
    local contentHeight = 80 + ButtonsLayout.AbsoluteContentSize.Y
    ContentFrame.Size = UDim2.new(1, 0, 0, contentHeight)
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, contentHeight)
    local screenSize = workspace.CurrentCamera.ViewportSize
    local maxHeight = screenSize.Y - 40 - SafeArea.Y * 2
    MainFrame.Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, math.min(maxHeight, 500))
    MainFrame.Position = UDim2.new(0.5, -MainFrame.Size.X.Offset/2, 0.5, -MainFrame.Size.Y.Offset/2 + SafeArea.Y/2)
end

ButtonsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateSizes)
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateSizes)

local isUIVisible = false
local TweenService = game:GetService("TweenService")

local function ToggleUI()
    isUIVisible = not isUIVisible
    
    if isUIVisible then
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, 0)
        TweenService:Create(
            FloatingBall,
            TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            {Size = UDim2.new(0, 40, 0, 40)}
        ):Play()
        local targetHeight = math.min(80 + ButtonsLayout.AbsoluteContentSize.Y, workspace.CurrentCamera.ViewportSize.Y - 40 - SafeArea.Y * 2)
        TweenService:Create(
            MainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint),
            {Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, math.min(targetHeight, 500))}
        ):Play()
        TweenService:Create(
            BlurEffect,
            TweenInfo.new(0.5),
            {Size = 10}
        ):Play()
    else
        TweenService:Create(
            MainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint),
            {Size = UDim2.new(0, MainFrame.Size.X.Offset, 0, 0)}
        ):Play()
        TweenService:Create(
            FloatingBall,
            TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 60, 0, 60)}
        ):Play()
        TweenService:Create(
            BlurEffect,
            TweenInfo.new(0.5),
            {Size = 0}
        ):Play()
        wait(0.5)
        MainFrame.Visible = false
    end
end

FloatingBall.MouseButton1Click:Connect(ToggleUI)

spawn(function()
    while true do
        for i = 1, 100 do
            FloatingBall.Position = UDim2.new(0, 20 + SafeArea.X, 0.5, -30 + SafeArea.Y/2 + math.sin(i/10) * 10)
            wait(0.05)
        end
        for i = 1, 20 do
            BallGlow.ImageTransparency = 0.5 + math.sin(i/5) * 0.2
            wait(0.05)
        end
    end
end)

spawn(function()
    while true do
        for i = 1, 100 do
            local hue = i/100
            local color = Color3.fromHSV(hue, 0.8, 1)
            TitleLabel.TextColor3 = color
            TitleLabel.TextStrokeColor3 = Color3.new(color.R * 0.5, color.G * 0.5, color.B * 0.5)
            NeonBorder.BackgroundColor3 = color
            wait(0.05)
        end
    end
end)
