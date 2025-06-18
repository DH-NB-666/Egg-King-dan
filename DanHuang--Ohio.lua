EggKing = "蛋皇NB且66"

if EggKing ~= "蛋皇NB且66" then
    game:GetService("Players").LocalPlayer:Kick("❌ 验证失败：请使用正版蛋皇脚本\n\nℹ️ 正确格式：\nEggKing = \"蛋皇NB且66\"")
    return
end

local Player = game:GetService("Players").LocalPlayer
local Tween = game:GetService("TweenService")
local Run = game:GetService("RunService")

local function CreateInstance(className,properties)
    local instance = Instance.new(className)
    for k,v in pairs(properties) do 
        instance[k] = v 
    end 
    return instance 
end

local UI = CreateInstance("ScreenGui",{
    Parent = game.CoreGui,
    DisplayOrder = 999,
    ResetOnSpawn = false,
    Name = "蛋皇独家加载界面"
})

local MainFrame = CreateInstance("Frame",{
    Size = UDim2.new(0,500,0,350),
    AnchorPoint = Vector2.new(0.5,0.5),
    Position = UDim2.new(0.5,0,0.5,0),
    BackgroundColor3 = Color3.fromRGB(20,30,50),
    Parent = UI
})
CreateInstance("UICorner",{CornerRadius = UDim.new(0,12), Parent = MainFrame})

local Title = CreateInstance("TextLabel",{
    Text = "蛋皇独家脚本加载中",
    Size = UDim2.new(1,-40,0,50),
    Position = UDim2.new(0,20,0,20),
    TextColor3 = Color3.fromRGB(255,215,0),
    Font = Enum.Font.GothamBold,
    TextSize = 28,
    BackgroundTransparency = 1,
    Parent = MainFrame
})

CreateInstance("UIStroke",{
    Thickness = 2,
    Color = Color3.fromRGB(255,180,0),
    Parent = Title
})

local UserInfoFrame = CreateInstance("Frame",{
    Size = UDim2.new(1,-40,0,80),
    Position = UDim2.new(0,20,0,80),
    BackgroundColor3 = Color3.fromRGB(30,40,70),
    Parent = MainFrame
})
CreateInstance("UICorner",{CornerRadius = UDim.new(0,8), Parent = UserInfoFrame})

local UserIdLabel = CreateInstance("TextLabel",{
    Text = "用户ID: "..Player.UserId,
    Size = UDim2.new(1,-20,0,30),
    Position = UDim2.new(0,10,0,10),
    TextColor3 = Color3.fromRGB(180,220,255),
    Font = Enum.Font.Gotham,
    TextSize = 16,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundTransparency = 1,
    Parent = UserInfoFrame
})

local UsernameLabel = CreateInstance("TextLabel",{
    Text = "用户名: "..Player.Name,
    Size = UDim2.new(1,-20,0,30),
    Position = UDim2.new(0,10,0,40),
    TextColor3 = Color3.fromRGB(180,220,255),
    Font = Enum.Font.Gotham,
    TextSize = 16,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundTransparency = 1,
    Parent = UserInfoFrame
})

local ProgressContainer = CreateInstance("Frame",{
    Size = UDim2.new(1,-40,0,20),
    Position = UDim2.new(0,20,0,180),
    BackgroundColor3 = Color3.fromRGB(30,40,70),
    Parent = MainFrame
})
CreateInstance("UICorner",{CornerRadius = UDim.new(1,0), Parent = ProgressContainer})

local ProgressBar = CreateInstance("Frame",{
    Size = UDim2.new(0,0,1,0),
    BackgroundColor3 = Color3.fromRGB(0,180,255),
    Parent = ProgressContainer
})
CreateInstance("UICorner",{CornerRadius = UDim.new(1,0), Parent = ProgressBar})

local ProgressGradient = CreateInstance("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,150,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,255,255))
    }),
    Rotation = 90,
    Parent = ProgressBar
})

local ProgressText = CreateInstance("TextLabel",{
    Text = "0%",
    Size = UDim2.new(1,0,0,30),
    Position = UDim2.new(0,0,0,30),
    TextColor3 = Color3.fromRGB(200,230,255),
    Font = Enum.Font.GothamMedium,
    TextSize = 18,
    BackgroundTransparency = 1,
    Parent = ProgressContainer
})

coroutine.wrap(function()
    for i = 1, 100 do
        ProgressBar.Size = UDim2.new(i/100,0,1,0)
        ProgressText.Text = string.format("加载进度: %d%%", i)
        ProgressGradient.Offset = Vector2.new((i/100)-1,0)
        
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
    
    UI:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DH-NB-666/Egg-King-dan/main/KsDH----Ohio.lua",true))()
end)()

local Particles = CreateInstance("Part",{
    Size = Vector3.new(1,1,1),
    Position = Vector3.new(0,10,0),
    Anchored = true,
    CanCollide = false,
    Transparency = 1,
    Parent = workspace
})

CreateInstance("ParticleEmitter",{
    Texture = "rbxassetid://242880866",
    Color = ColorSequence.new(Color3.fromRGB(0,180,255)),
    Size = NumberSequence.new(0.5,2),
    Speed = NumberRange.new(15),
    Lifetime = NumberRange.new(2),
    Rate = 30,
    Parent = Particles
})
Particles.ParticleEmitter:Emit(50)

game:GetService("Debris"):AddItem(Particles, 5)
