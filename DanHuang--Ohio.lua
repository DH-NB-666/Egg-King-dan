local hasRun = false
local colors = {Color3.new(1,0,0),Color3.new(1,0.5,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,0,1),Color3.new(0.5,0,1)}

while not hasRun do
    local remaining = 5
    while remaining > 0 do
        local randomColor = colors[math.random(#colors)]
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title="*快手蛋皇*",
            Text="😳 倒计时："..remaining.."秒",
            Duration=1,
            Font=Enum.Font.GothamBold,
            Size=24,
            TextColor3=randomColor,
            BackgroundColor3=randomColor:lerp(Color3.new(0,0,0),0.3)
        })
        task.wait(1)
        remaining = remaining - 1
    end
    
    local function run(url)
        pcall(function()
            loadstring(game:HttpGet(url, true))()
        end)
    end
    
    run("https://pastebin.com/raw/YUn7uTxt")
    run("https://raw.githubusercontent.com/nainshu/no/main/%E9%98%B2%E4%B8%80%E6%8B%B3.lua")
    
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://5651641845"
    sound.Volume = 10
    sound.PlaybackSpeed = 0.9
    sound.Pitch = 0.95
    sound.Parent = game:GetService("SoundService")
    
    local eq = Instance.new("EqualizerSoundEffect")
    eq.HighGain = 0
    eq.MidGain = 5
    eq.LowGain = 10
    eq.Parent = sound
    
    sound:Play()
    
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title="*快手蛋皇*",
        Text="✅ 脚本执行完成！",
        Duration=3,
        TextColor3=Color3.new(0,1,0),
        Size=24
    })
    print("脚本执行完成")
    hasRun = true
end
