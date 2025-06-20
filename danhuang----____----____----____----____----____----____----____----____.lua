--学生党不要偷我ui
--我会生气的
local player = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local gui = Instance.new("ScreenGui")
gui.Name = "DanHuangRainbowUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

Lighting.GlobalShadows = true
Lighting.Outlines = false
Lighting.Brightness = 2
Lighting.EnvironmentDiffuseScale = 0.5
Lighting.EnvironmentSpecularScale = 0.5
Lighting.ClockTime = 14
Lighting.GeographicLatitude = 30

local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.4
bloom.Size = 24
bloom.Threshold = 0.8
bloom.Parent = Lighting

local colorCorrection = Instance.new("ColorCorrectionEffect")
colorCorrection.Brightness = 0.1
colorCorrection.Contrast = 0.2
colorCorrection.Saturation = 0.1
colorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
colorCorrection.Parent = Lighting

local sunRays = Instance.new("SunRaysEffect")
sunRays.Intensity = 0.2
sunRays.Spread = 1
sunRays.Parent = Lighting

local bgMusic = Instance.new("Sound")
bgMusic.SoundId = "rbxassetid://76463442516219"
bgMusic.Volume = 0.3
bgMusic.Looped = true
bgMusic.Parent = SoundService
bgMusic:Play()

local toggleButton = Instance.new("ImageButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(1, -60, 0.5, -25)
toggleButton.Image = "rbxassetid://3570695787"
toggleButton.ScaleType = Enum.ScaleType.Slice
toggleButton.SliceCenter = Rect.new(100, 100, 100, 100)
toggleButton.BackgroundTransparency = 1
toggleButton.Parent = gui

local buttonGlow = Instance.new("Frame")
buttonGlow.Name = "ButtonGlow"
buttonGlow.Size = UDim2.new(1, 10, 1, 10)
buttonGlow.Position = UDim2.new(0, -5, 0, -5)
buttonGlow.BackgroundTransparency = 1
buttonGlow.Parent = toggleButton

local glowCorner = Instance.new("UICorner")
glowCorner.CornerRadius = UDim.new(1, 0)
glowCorner.Parent = buttonGlow

local glowStroke = Instance.new("UIStroke")
glowStroke.Thickness = 3
glowStroke.Parent = buttonGlow

coroutine.wrap(function()
    local hue = 0
    while true do
        hue = (hue + 0.02) % 1
        glowStroke.Color = Color3.fromHSV(hue, 1, 1)
        toggleButton.ImageColor3 = Color3.fromHSV((hue + 0.5) % 1, 0.8, 1)
        task.wait()
    end
end)()

local uiFrame = Instance.new("Frame")
uiFrame.Name = "MainUI"
uiFrame.Size = UDim2.new(0, 400, 0, 400)
uiFrame.Position = UDim2.new(0.5, -200, 0.4, -200)
uiFrame.BackgroundTransparency = 1
uiFrame.Visible = false
uiFrame.ClipsDescendants = true
uiFrame.Parent = gui

local uiBackground = Instance.new("Frame")
uiBackground.Name = "Background"
uiBackground.Size = UDim2.new(1, 0, 1, 0)
uiBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
uiBackground.BackgroundTransparency = 0.1
uiBackground.Parent = uiFrame

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})
gradient.Rotation = 0
gradient.Parent = uiBackground

coroutine.wrap(function()
    local rotationSpeed = 360
    while true do
        local deltaTime = wait(0.03)
        gradient.Rotation = (gradient.Rotation + rotationSpeed * deltaTime) % 360
    end
end)()

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 15)
uiCorner.Parent = uiBackground

local borderGlow = Instance.new("Frame")
borderGlow.Name = "BorderGlow"
borderGlow.Size = UDim2.new(1, 10, 1, 10)
borderGlow.Position = UDim2.new(0, -5, 0, -5)
borderGlow.BackgroundTransparency = 1
borderGlow.Parent = uiFrame

local borderStroke = Instance.new("UIStroke")
borderStroke.Thickness = 3
borderStroke.Parent = borderGlow

coroutine.wrap(function()
    local hue = 0
    while true do
        hue = (hue + 0.01) % 1
        borderStroke.Color = Color3.fromHSV(hue, 1, 1)
        task.wait()
    end
end)()

local userInfoFrame = Instance.new("Frame")
userInfoFrame.Name = "UserInfoFrame"
userInfoFrame.Size = UDim2.new(0.9, 0, 0, 140)
userInfoFrame.Position = UDim2.new(0.05, 0, 0.15, 0)
userInfoFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
userInfoFrame.BackgroundTransparency = 0.5
userInfoFrame.Parent = uiFrame

local userInfoCorner = Instance.new("UICorner")
userInfoCorner.CornerRadius = UDim.new(0, 10)
userInfoCorner.Parent = userInfoFrame

local userInfoStroke = Instance.new("UIStroke")
userInfoStroke.Thickness = 1
userInfoStroke.Color = Color3.fromRGB(100, 100, 150)
userInfoStroke.Parent = userInfoFrame

local function getUserInfo()
    local userId = player.UserId
    local username = player.Name
    local displayName = player.DisplayName
    
    local deviceType
    if game:GetService("UserInputService").TouchEnabled then
        deviceType = "移动设备"
    else
        deviceType = "电脑"
    end
    
    local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local accountAge = "账号年龄: "..player.AccountAge.." 天"
    
    local locale = game:GetService("LocalizationService").RobloxLocaleId
    local regionMap = {
        ["zh-cn"] = "中国",
        ["en-us"] = "美国",
        ["ja-jp"] = "日本",
        ["ko-kr"] = "韩国",
        ["es-es"] = "西班牙",
        ["pt-br"] = "巴西",
        ["fr-fr"] = "法国",
        ["de-de"] = "德国",
        ["ru-ru"] = "俄罗斯",
        ["id-id"] = "印度尼西亚",
        ["th-th"] = "泰国",
        ["vi-vn"] = "越南"
    }
    local region = "地区: "..(regionMap[locale:lower()] or locale)
    
    return {
        Username = "用户名: "..username,
        DisplayName = "显示名: "..displayName,
        UserId = "用户ID: "..userId,
        Device = "设备: "..deviceType,
        AccountAge = accountAge,
        Region = region,
        GameName = "当前游戏: "..gameName
    }
end

local userInfo = getUserInfo()

local infoText1 = Instance.new("TextLabel")
infoText1.Name = "InfoText1"
infoText1.Size = UDim2.new(0.45, 0, 0, 20)
infoText1.Position = UDim2.new(0.05, 0, 0.05, 0)
infoText1.Text = userInfo.Username
infoText1.Font = Enum.Font.GothamMedium
infoText1.TextSize = 14
infoText1.TextColor3 = Color3.fromRGB(200, 200, 255)
infoText1.TextXAlignment = Enum.TextXAlignment.Left
infoText1.BackgroundTransparency = 1
infoText1.Parent = userInfoFrame

local infoText2 = Instance.new("TextLabel")
infoText2.Name = "InfoText2"
infoText2.Size = UDim2.new(0.45, 0, 0, 20)
infoText2.Position = UDim2.new(0.55, 0, 0.05, 0)
infoText2.Text = userInfo.UserId
infoText2.Font = Enum.Font.GothamMedium
infoText2.TextSize = 14
infoText2.TextColor3 = Color3.fromRGB(200, 200, 255)
infoText2.TextXAlignment = Enum.TextXAlignment.Left
infoText2.BackgroundTransparency = 1
infoText2.Parent = userInfoFrame

local infoText3 = Instance.new("TextLabel")
infoText3.Name = "InfoText3"
infoText3.Size = UDim2.new(0.45, 0, 0, 20)
infoText3.Position = UDim2.new(0.05, 0, 0.25, 0)
infoText3.Text = userInfo.Device
infoText3.Font = Enum.Font.GothamMedium
infoText3.TextSize = 14
infoText3.TextColor3 = Color3.fromRGB(200, 200, 255)
infoText3.TextXAlignment = Enum.TextXAlignment.Left
infoText3.BackgroundTransparency = 1
infoText3.Parent = userInfoFrame

local infoText4 = Instance.new("TextLabel")
infoText4.Name = "InfoText4"
infoText4.Size = UDim2.new(0.45, 0, 0, 20)
infoText4.Position = UDim2.new(0.55, 0, 0.25, 0)
infoText4.Text = userInfo.AccountAge
infoText4.Font = Enum.Font.GothamMedium
infoText4.TextSize = 14
infoText4.TextColor3 = Color3.fromRGB(200, 200, 255)
infoText4.TextXAlignment = Enum.TextXAlignment.Left
infoText4.BackgroundTransparency = 1
infoText4.Parent = userInfoFrame

local infoText5 = Instance.new("TextLabel")
infoText5.Name = "InfoText5"
infoText5.Size = UDim2.new(0.9, 0, 0, 20)
infoText5.Position = UDim2.new(0.05, 0, 0.45, 0)
infoText5.Text = userInfo.Region
infoText5.Font = Enum.Font.GothamMedium
infoText5.TextSize = 14
infoText5.TextColor3 = Color3.fromRGB(200, 200, 255)
infoText5.TextXAlignment = Enum.TextXAlignment.Left
infoText5.BackgroundTransparency = 1
infoText5.Parent = userInfoFrame

local infoText6 = Instance.new("TextLabel")
infoText6.Name = "InfoText6"
infoText6.Size = UDim2.new(0.9, 0, 0, 20)
infoText6.Position = UDim2.new(0.05, 0, 0.65, 0)
infoText6.Text = userInfo.GameName
infoText6.Font = Enum.Font.GothamMedium
infoText6.TextSize = 14
infoText6.TextColor3 = Color3.fromRGB(200, 200, 255)
infoText6.TextXAlignment = Enum.TextXAlignment.Left
infoText6.BackgroundTransparency = 1
infoText6.Parent = userInfoFrame

local function createRainbowText(parent, text, position)
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0.9, 0, 0, 30)
    textLabel.Position = position
    textLabel.Text = text
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 18
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.BackgroundTransparency = 1
    textLabel.Parent = parent
    
    coroutine.wrap(function()
        local hue = 0
        while true do
            hue = (hue + 0.01) % 1
            textLabel.TextColor3 = Color3.fromHSV(hue, 0.8, 1)
            task.wait()
        end
    end)()
    
    local textStroke = Instance.new("UIStroke")
    textStroke.Thickness = 2
    textStroke.Color = Color3.fromRGB(0, 0, 0)
    textStroke.Transparency = 0.5
    textStroke.Parent = textLabel
    
    return textLabel
end

createRainbowText(uiFrame, "QQ交流群: 1002534520", UDim2.new(0.05, 0, 0.55, 0))
createRainbowText(uiFrame, "作者: 蛋皇", UDim2.new(0.05, 0, 0.65, 0))
createRainbowText(uiFrame, "公告：目前只更新Ohio脚本 持续更新中...", UDim2.new(0.05, 0, 0.75, 0))

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 20, 0, 10)
title.Text = "蛋皇独家脚本"
title.Font = Enum.Font.GothamBlack
title.TextSize = 28
title.BackgroundTransparency = 1
title.Parent = uiFrame

coroutine.wrap(function()
    local hue = 0
    while true do
        hue = (hue + 0.015) % 1
        title.TextColor3 = Color3.fromHSV(hue, 0.8, 1)
        task.wait()
    end
end)()

local titleStroke = Instance.new("UIStroke")
titleStroke.Thickness = 4
titleStroke.Color = Color3.fromRGB(0, 0, 0)
titleStroke.Transparency = 0.3
titleStroke.Parent = title

local executeButton = Instance.new("TextButton")
executeButton.Name = "ExecuteButton"
executeButton.Size = UDim2.new(0.9, 0, 0, 50)
executeButton.Position = UDim2.new(0.05, 0, 0.85, 0)
executeButton.Text = "👉启动蛋皇独家Ohio脚本👈"
executeButton.Font = Enum.Font.GothamBlack
executeButton.TextSize = 20
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.AutoButtonColor = false
executeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
executeButton.Parent = uiFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = executeButton

local buttonGlow = Instance.new("Frame")
buttonGlow.Name = "ButtonGlow"
buttonGlow.Size = UDim2.new(1, 6, 1, 6)
buttonGlow.Position = UDim2.new(0, -3, 0, -3)
buttonGlow.BackgroundTransparency = 1
buttonGlow.Parent = executeButton

local buttonStroke = Instance.new("UIStroke")
buttonStroke.Thickness = 2
buttonStroke.Parent = buttonGlow

executeButton.MouseEnter:Connect(function()
    TweenService:Create(
        executeButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(60, 60, 90)}
    ):Play()
    TweenService:Create(
        buttonStroke,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Thickness = 4}
    ):Play()
end)

executeButton.MouseLeave:Connect(function()
    TweenService:Create(
        executeButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(40, 40, 60)}
    ):Play()
    TweenService:Create(
        buttonStroke,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Thickness = 2}
    ):Play()
end)

local rainbowBeansContainer = Instance.new("Frame")
rainbowBeansContainer.Name = "RainbowBeansContainer"
rainbowBeansContainer.Size = UDim2.new(1, 0, 1, 0)
rainbowBeansContainer.BackgroundTransparency = 1
rainbowBeansContainer.ClipsDescendants = true
rainbowBeansContainer.Parent = uiFrame

local function createRainbowBean()
    local bean = Instance.new("Frame")
    bean.Name = "RainbowBean"
    bean.Size = UDim2.new(0, math.random(4, 8), 0, math.random(4, 8))
    bean.Position = UDim2.new(math.random(), 0, 0, -10)
    bean.BackgroundColor3 = Color3.fromHSV(math.random(), 1, 1)
    bean.BackgroundTransparency = 0.3
    bean.Parent = rainbowBeansContainer
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(1, 0)
    uiCorner.Parent = bean
    
    local speed = math.random(1, 3)
    local sway = math.random(-50, 50) / 100
    
    coroutine.wrap(function()
        while bean.Parent do
            bean.Position = UDim2.new(
                bean.Position.X.Scale + sway * 0.005,
                bean.Position.X.Offset,
                bean.Position.Y.Scale + speed * 0.01,
                bean.Position.Y.Offset
            )
            
            if math.random(1, 20) == 1 then
                bean.BackgroundColor3 = Color3.fromHSV(math.random(), 1, 1)
            end
            
            if bean.Position.Y.Scale > 1 then
                bean:Destroy()
                break
            end
            
            task.wait()
        end
    end)()
end

coroutine.wrap(function()
    while uiFrame.Parent do
        if uiFrame.Visible then
            createRainbowBean()
            task.wait(0.1)
        else
            task.wait(1)
        end
    end
end)()

local fireContainer = Instance.new("Frame")
fireContainer.Name = "FireContainer"
fireContainer.Size = UDim2.new(1, 0, 0, 20)
fireContainer.Position = UDim2.new(0, 0, 1, -10)
fireContainer.BackgroundTransparency = 1
fireContainer.Parent = uiFrame

for i = 1, 15 do
    local fireParticle = Instance.new("Frame")
    fireParticle.Name = "FireParticle"
    fireParticle.Size = UDim2.new(0, math.random(8, 15), 0, math.random(8, 15))
    fireParticle.Position = UDim2.new(math.random(), 0, 0, 0)
    fireParticle.AnchorPoint = Vector2.new(0.5, 0.5)
    fireParticle.BackgroundColor3 = Color3.fromRGB(255, math.random(100, 200), 0)
    fireParticle.BackgroundTransparency = math.random(30, 70)/100
    fireParticle.Parent = fireContainer
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0.5, 0)
    uiCorner.Parent = fireParticle
    
    coroutine.wrap(function()
        local baseX = fireParticle.Position.X.Scale
        local baseY = fireParticle.Position.Y.Scale
        local speed = math.random(5, 10)/10
        local sway = math.random(5, 15)/100
        
        while fireParticle.Parent do
            local time = tick() * speed
            fireParticle.Position = UDim2.new(
                baseX + math.sin(time) * sway,
                0,
                baseY + math.sin(time * 2) * 0.05,
                0
            )
            
            fireParticle.BackgroundColor3 = Color3.fromRGB(
                255,
                math.random(100, 200),
                math.random(0, 50)
            )
            
            fireParticle.BackgroundTransparency = math.random(30, 70)/100
            
            task.wait(0.1)
        end
    end)()
end

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(0.9, 0, 0, 30)
statusLabel.Position = UDim2.new(0.05, 0, 0.95, 0)
statusLabel.Text = ""
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 18
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.BackgroundTransparency = 1
statusLabel.Visible = false
statusLabel.Parent = uiFrame

executeButton.MouseButton1Click:Connect(function()
    statusLabel.Text = "执行中...请等待"
    statusLabel.TextColor3 = Color3.fromRGB(255, 255, 150)
    statusLabel.Visible = true
    
    executeButton.AutoButtonColor = false
    executeButton.Text = "执行中..."
    executeButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DH-NB-666/Dan_Huang_-_-_-_-_-_-_-_-_-_-_-_-_-_NB666/main/ks_dan-huang-ohio-script.lua", true))()
    end)
    
    if not success then
        statusLabel.Text = "执行失败!"
        statusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        executeButton.Text = "❌ 加载失败!"
        executeButton.BackgroundColor3 = Color3.fromRGB(180, 80, 80)
    else
        statusLabel.Text = "脚本已经成功执行!"
        statusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        executeButton.Text = "✅ 加载成功!"
        executeButton.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
        
        task.wait(1)
        TweenService:Create(
            uiFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            {Position = UDim2.new(1.5, 0, 0.4, 0)}
        ):Play()
        task.wait(0.5)
        uiFrame.Visible = false
    end
    
    task.wait(1.5)
    statusLabel.Visible = false
    executeButton.Text = "👉启动蛋皇独家Ohio脚本👈"
    executeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    executeButton.AutoButtonColor = true
end)

local function showUI()
    uiFrame.Visible = true
    
    uiFrame.Size = UDim2.new(0, 10, 0, 10)
    uiFrame.Position = UDim2.new(1, -5, 0.5, -5)
    uiFrame.Rotation = 0
    uiFrame.BackgroundTransparency = 1
    uiBackground.BackgroundTransparency = 1
    
    local flyIn = TweenService:Create(
        uiFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0, 450, 0, 450),
            Position = UDim2.new(0.5, -225, 0.4, -225),
            Rotation = 720,
            BackgroundTransparency = 0
        }
    )
    
    local bounce = TweenService:Create(
        uiFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
        {
            Size = UDim2.new(0, 400, 0, 400),
            Position = UDim2.new(0.5, -200, 0.4, -200)
        }
    )
    
    local bgFade = TweenService:Create(
        uiBackground,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0.1}
    )
    
    local popSound = Instance.new("Sound")
    popSound.SoundId = "rbxassetid://1593373455"
    popSound.Volume = 0.4
    popSound.Parent = uiFrame
    popSound:Play()
    game:GetService("Debris"):AddItem(popSound, 2)
    
    flyIn:Play()
    task.wait(0.5)
    bounce:Play()
    bgFade:Play()
end

local function hideUI()
    local closeSound = Instance.new("Sound")
    closeSound.SoundId = "rbxassetid://138080575"
    closeSound.Volume = 0.3
    closeSound.Parent = uiFrame
    closeSound:Play()
    game:GetService("Debris"):AddItem(closeSound, 2)
    
    local shrink = TweenService:Create(
        uiFrame,
        TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {
            Size = UDim2.new(0, 10, 0, 10),
            Position = UDim2.new(1, -5, 0.5, -5),
            Rotation = -720
        }
    )
    
    local fadeOut = TweenService:Create(
        uiFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1}
    )
    
    local bgFadeOut = TweenService:Create(
        uiBackground,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundTransparency = 1}
    )
    
    shrink:Play()
    fadeOut:Play()
    bgFadeOut:Play()
    
    task.wait(0.4)
    uiFrame.Visible = false
end

local uiVisible = false
toggleButton.MouseButton1Click:Connect(function()
    uiVisible = not uiVisible
    
    if uiVisible then
        showUI()
    else
        hideUI()
    end
end)

print("蛋皇NB且无敌")
