EggKing = "蛋皇NB且66"

if _G.EggKing ~= "蛋皇NB且66" then
    game:GetService("Players").LocalPlayer:Kick("❌ 验证失败：请使用正版蛋皇脚本\n\nℹ️ 正确格式：\nEggKing = \"蛋皇NB且66\"")
    return
end

local envChecks = {
    {"getfenv", type(getfenv(0)) == "table"},
    {"getgc", pcall(function() return #getgc() > 0 end)},
    {"getreg", pcall(function() return #debug.getregistry() > 0 end)}
}

for _, check in ipairs(envChecks) do
    if not check[2] then
        game:GetService("Players").LocalPlayer:Kick("⚠️ 环境异常检测 (0xDH"..string.byte(check[1]:sub(1,1))..")")
        return
    end
end

if debug.gethook() ~= nil then
    game:GetService("Players").LocalPlayer:Kick("⚠️ 安全防护触发 (0xANTIHOOK)")
    return
end

local Player = game:GetService("Players").LocalPlayer
local Tween = game:GetService("TweenService")
local Run = game:GetService("RunService")

local function C(c,p)
    local i = Instance.new(c)
    for k,v in pairs(p) do i[k] = v end
    return i
end

local UI = C("ScreenGui",{
    Parent = game.CoreGui,
    DisplayOrder = 999,
    ResetOnSpawn = false,
    Name = "蛋皇独家加载界面"
})

local MF = C("Frame",{
    Size = UDim2.new(0,500,0,350),
    AnchorPoint = Vector2.new(0.5,0.5),
    Position = UDim2.new(0.5,0,0.5,0),
    BackgroundColor3 = Color3.fromRGB(20,30,50),
    Parent = UI
})
C("UICorner",{CornerRadius = UDim.new(0,12), Parent = MF})

local Title = C("TextLabel",{
    Text = "蛋皇独家脚本加载中",
    Size = UDim2.new(1,-40,0,50),
    Position = UDim2.new(0,20,0,20),
    TextColor3 = Color3.fromRGB(255,215,0),
    Font = Enum.Font.GothamBold,
    TextSize = 28,
    BackgroundTransparency = 1,
    Parent = MF
})

C("UIStroke",{
    Thickness = 2,
    Color = Color3.fromRGB(255,180,0),
    Parent = Title
})

local UIFrame = C("Frame",{
    Size = UDim2.new(1,-40,0,80),
    Position = UDim2.new(0,20,0,80),
    BackgroundColor3 = Color3.fromRGB(30,40,70),
    Parent = MF
})
C("UICorner",{CornerRadius = UDim.new(0,8), Parent = UIFrame})

C("TextLabel",{
    Text = "用户ID: "..Player.UserId,
    Size = UDim2.new(1,-20,0,30),
    Position = UDim2.new(0,10,0,10),
    TextColor3 = Color3.fromRGB(180,220,255),
    Font = Enum.Font.Gotham,
    TextSize = 16,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundTransparency = 1,
    Parent = UIFrame
})

C("TextLabel",{
    Text = "用户名: "..Player.Name,
    Size = UDim2.new(1,-20,0,30),
    Position = UDim2.new(0,10,0,40),
    TextColor3 = Color3.fromRGB(180,220,255),
    Font = Enum.Font.Gotham,
    TextSize = 16,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundTransparency = 1,
    Parent = UIFrame
})

local PC = C("Frame",{
    Size = UDim2.new(1,-40,0,20),
    Position = UDim2.new(0,20,0,180),
    BackgroundColor3 = Color3.fromRGB(30,40,70),
    Parent = MF
})
C("UICorner",{CornerRadius = UDim.new(1,0), Parent = PC})

local PB = C("Frame",{
    Size = UDim2.new(0,0,1,0),
    BackgroundColor3 = Color3.fromRGB(0,180,255),
    Parent = PC
})
C("UICorner",{CornerRadius = UDim.new(1,0), Parent = PB})

C("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,150,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,255,255))
    }),
    Rotation = 90,
    Parent = PB
})

local PT = C("TextLabel",{
    Text = "0%",
    Size = UDim2.new(1,0,0,30),
    Position = UDim2.new(0,0,0,30),
    TextColor3 = Color3.fromRGB(200,230,255),
    Font = Enum.Font.GothamMedium,
    TextSize = 18,
    BackgroundTransparency = 1,
    Parent = PC
})

coroutine.wrap(function()
    for i = 1, 100 do
        PB.Size = UDim2.new(i/100,0,1,0)
        PT.Text = string.format("加载进度: %d%%", i)
        if i % 10 == 0 then
            Tween:Create(Title, TweenInfo.new(0.3), {
                TextColor3 = Color3.fromRGB(255, math.random(150,255), 0)
            }):Play()
        end
        task.wait(0.03)
    end
    
    Title.Text = "加载完成!"
    Tween:Create(Title, TweenInfo.new(0.5), {
        TextColor3 = Color3.fromRGB(0,255,150)
    }):Play()
    task.wait(0.8)
    
    if _G.EggKing ~= "蛋皇NB且66" then
        game:GetService("Players").LocalPlayer:Kick("⚠️ 运行时验证失败")
        return
    end
    
    UI:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DH-NB-666/Egg-King-dan/main/KsDH----Ohio.lua",true))()
end)()

local Part = C("Part",{
    Size = Vector3.new(1,1,1),
    Position = Vector3.new(0,10,0),
    Anchored = true,
    CanCollide = false,
    Transparency = 1,
    Parent = workspace
})

C("ParticleEmitter",{
    Texture = "rbxassetid://242880866",
    Color = ColorSequence.new(Color3.fromRGB(0,180,255)),
    Size = NumberSequence.new(0.5,2),
    Speed = NumberRange.new(15),
    Lifetime = NumberRange.new(2),
    Rate = 30,
    Parent = Part
})
Part.ParticleEmitter:Emit(50)
game:GetService("Debris"):AddItem(Part, 5)

delay(30, function()
    if not UI.Parent then
        game:GetService("Players").LocalPlayer:Kick("⚠️ 界面异常终止")
    end
end)
