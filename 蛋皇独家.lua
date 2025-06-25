local player = game:GetService("Players").LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "BlackOverlay"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

local keyFrame = Instance.new("Frame", gui)
keyFrame.Size = UDim2.new(0.4, 0, 0.3, 0)
keyFrame.Position = UDim2.new(0.3, 0, 0.35, 0)
keyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keyFrame.BorderSizePixel = 0

local corner = Instance.new("UICorner", keyFrame)
corner.CornerRadius = UDim.new(0.05, 0)

local title = Instance.new("TextLabel", keyFrame)
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0.1, 0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 24
title.Text = "蛋皇独家巴掌模拟器脚本"
title.Font = Enum.Font.SourceSansBold

local subtitle = Instance.new("TextLabel", keyFrame)
subtitle.Size = UDim2.new(1, 0, 0.2, 0)
subtitle.Position = UDim2.new(0, 0, 0.3, 0)
subtitle.BackgroundTransparency = 1
subtitle.TextColor3 = Color3.new(1, 1, 1)
subtitle.TextSize = 18
subtitle.Text = "请输入卡密进行验证"
subtitle.Font = Enum.Font.SourceSans

local inputBox = Instance.new("TextBox", keyFrame)
inputBox.Size = UDim2.new(0.8, 0, 0.2, 0)
inputBox.Position = UDim2.new(0.1, 0, 0.5, 0)
inputBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
inputBox.TextColor3 = Color3.new(1, 1, 1)
inputBox.TextSize = 18
inputBox.PlaceholderText = "在此输入卡密"
inputBox.ClearTextOnFocus = false

local inputCorner = Instance.new("UICorner", inputBox)
inputCorner.CornerRadius = UDim.new(0.2, 0)

local verifyButton = Instance.new("TextButton", keyFrame)
verifyButton.Size = UDim2.new(0.4, 0, 0.2, 0)
verifyButton.Position = UDim2.new(0.3, 0, 0.75, 0)
verifyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
verifyButton.TextColor3 = Color3.new(1, 1, 1)
verifyButton.TextSize = 18
verifyButton.Text = "验证卡密"

local buttonCorner = Instance.new("UICorner", verifyButton)
buttonCorner.CornerRadius = UDim.new(0.2, 0)

verifyButton.MouseEnter:Connect(function()
    verifyButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
end)

verifyButton.MouseLeave:Connect(function()
    verifyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)

local errorLabel = Instance.new("TextLabel", keyFrame)
errorLabel.Size = UDim2.new(1, 0, 0.1, 0)
errorLabel.Position = UDim2.new(0, 0, 0.9, 0)
errorLabel.BackgroundTransparency = 1
errorLabel.TextColor3 = Color3.new(1, 0, 0)
errorLabel.TextSize = 16
errorLabel.Text = ""
errorLabel.Font = Enum.Font.SourceSans
errorLabel.Visible = false

local correctKey = "d59501d9795766380ea11278a"

local function executeMainScript()
    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Position = UDim2.new(0, 0, 0, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BorderSizePixel = 0

    gui.DisplayOrder = 999999

    local executingText = Instance.new("TextLabel", frame)
    executingText.Size = UDim2.new(1, 0, 0.2, 0)
    executingText.Position = UDim2.new(0, 0, 0.4, 0)
    executingText.BackgroundTransparency = 1
    executingText.TextColor3 = Color3.new(1, 1, 1)
    executingText.TextSize = 36
    executingText.Text = "蛋皇独家巴掌模拟器脚本正在执行中...."
    executingText.Font = Enum.Font.SourceSansBold

    local hue = 0
    local textColorConnection = game:GetService("RunService").Heartbeat:Connect(function()
        hue = (hue + 0.01) % 1
        executingText.TextColor3 = Color3.fromHSV(hue, 1, 1)
    end)

    local function showSuccessMessage()
        executingText:Destroy()
        textColorConnection:Disconnect()
        
        local successText = Instance.new("TextLabel", frame)
        successText.Size = UDim2.new(1, 0, 0.2, 0)
        successText.Position = UDim2.new(0, 0, 0.4, 0)
        successText.BackgroundTransparency = 1
        successText.TextColor3 = Color3.new(0, 1, 0)
        successText.TextSize = 42
        successText.Text = "执行成功 祝您玩的愉快！"
        successText.Font = Enum.Font.SourceSansBold
        
        local infoFrame = Instance.new("Frame", gui)
        infoFrame.Size = UDim2.new(0.3, 0, 0.15, 0)
        infoFrame.Position = UDim2.new(0.7, 0, 0.05, 0)
        infoFrame.BackgroundTransparency = 1
        infoFrame.BorderSizePixel = 0
        
        local userIdLabel = Instance.new("TextLabel", infoFrame)
        userIdLabel.Size = UDim2.new(1, 0, 0.3, 0)
        userIdLabel.Position = UDim2.new(0, 10, 0, 0)
        userIdLabel.BackgroundTransparency = 1
        userIdLabel.TextColor3 = Color3.new(1, 1, 1)
        userIdLabel.TextSize = 18
        userIdLabel.Text = "用户ID: "..player.UserId
        userIdLabel.Font = Enum.Font.SourceSansBold
        userIdLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local usernameLabel = Instance.new("TextLabel", infoFrame)
        usernameLabel.Size = UDim2.new(1, 0, 0.3, 0)
        usernameLabel.Position = UDim2.new(0, 10, 0.3, 0)
        usernameLabel.BackgroundTransparency = 1
        usernameLabel.TextColor3 = Color3.new(0.4, 0.8, 1)
        usernameLabel.TextSize = 18
        usernameLabel.Text = "用户名: "..player.Name
        usernameLabel.Font = Enum.Font.SourceSansBold
        usernameLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local specialLabel = Instance.new("TextLabel", infoFrame)
        specialLabel.Size = UDim2.new(1, 0, 0.4, 0)
        specialLabel.Position = UDim2.new(0, 10, 0.6, 0)
        specialLabel.BackgroundTransparency = 1
        specialLabel.TextColor3 = Color3.new(1, 0, 0)
        specialLabel.TextSize = 20
        specialLabel.Text = "蛋皇现实人不错"
        specialLabel.Font = Enum.Font.SourceSansBold
        specialLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local hue = 0
        game:GetService("RunService").Heartbeat:Connect(function()
            hue = (hue + 0.01) % 1
            specialLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
        end)
        
        wait(2)
        for i = 1, 20 do
            frame.BackgroundTransparency = frame.BackgroundTransparency + 0.05
            successText.TextTransparency = successText.TextTransparency + 0.05
            wait(0.05)
        end
        frame:Destroy()
    end

    local function loadExternalScript()
        local success, err = pcall(function()
            loadstring(game:HttpGet('https://pastefy.app/lgEl3Mga/raw'))()
        end)
        
        if success then
            showSuccessMessage()
        else
            local errorLabel = Instance.new("TextLabel", frame)
            errorLabel.Size = UDim2.new(1, 0, 0.1, 0)
            errorLabel.Position = UDim2.new(0, 0, 0.5, 0)
            errorLabel.BackgroundTransparency = 1
            errorLabel.TextColor3 = Color3.new(1, 0, 0)
            errorLabel.TextSize = 24
            errorLabel.Text = "加载失败: "..tostring(err)
            errorLabel.Font = Enum.Font.SourceSansBold
            
            warn("Error loading external script: "..err)
        end
    end

    task.spawn(function()
        wait(0.5)
        loadExternalScript()
    end)
end

local function verifyKey()
    local enteredKey = inputBox.Text
    if enteredKey == correctKey then
        keyFrame:Destroy()
        executeMainScript()
    else
        errorLabel.Text = "卡密错误，请重新输入"
        errorLabel.Visible = true
        inputBox.Text = ""
    end
end

verifyButton.MouseButton1Click:Connect(verifyKey)
inputBox.Focused:Connect(function()
    errorLabel.Visible = false
end)
inputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        verifyKey()
    end
end)
