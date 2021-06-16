--Services
local storage = game:GetService("ReplicatedStorage")
local player = game:GetService("Players")

local ply = player.LocalPlayer
local InfiniteStaminabool = false
local AutoSackbool = false
local SuperSpeedbool = false
local removeJumpDelaybool = false

local function AutoSacks()
    local team = ply.PlayerTeam.Value
    local QB = storage.Assets.GameAssets.Config.Quarterback.Value; repeat wait() until #QB > 0
    local airball = storage.Assets.GameAssets.Config.BallInAir.Value
    local QBTeam = player[QB].PlayerTeam.Value
    local ball = getrenv()._G.Ball
    if team ~= QBTeam and tostring(ball) == "Handle" and not airball then
        footbalLocation = ball.CFrame
        ply.Character.HumanoidRootPart.CFrame = footbalLocation
    end
end

local function infStamina()
    local plyStamina = ply.Stamina.Value
    if ply.Stamina.Value == 100 then
        ply.Stamina.Value = math.huge
    end
end

local function superSpeed()
    local antispeedhack = ply.PlayerGui.ClientModel:FindFirstChild("AntiSpeedHackV3")
    if antispeedhack then antispeedhack:Destroy(); print("AntiSpeedHack Removed.") end
    if ply.Character.Humanoid.WalkSpeed ~= 75 then
        ply.Character.Humanoid.WalkSpeed = 75
    end
end

local function removeJumpDelay()
    for k,v in pairs(getsenv(game:GetService("Players").Thissole58.PlayerGui.ClientModel.Jumping)) do
        if type(v) == 'function' then
            debug.setupvalue(v,1,true)
        end
    end
end

--GUI
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local InfiniteStamina = Instance.new("TextButton")
local AutoSack = Instance.new("TextButton")
local SuperSpeed = Instance.new("TextButton")
local RemoveJumpDelay = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = ScreenGui
Main.Active = true
Main.BackgroundColor3 = Color3.fromRGB(72, 72, 72)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.Position = UDim2.new(0.77, 0, 0.644963145, 0)
Main.Selectable = true
Main.Size = UDim2.new(0, 340, 0, 280)

TextLabel.Parent = Main
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 38, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.Size = UDim2.new(0, 340, 0, 50)
TextLabel.Font = Enum.Font.TitilliumWeb
TextLabel.Text = "Football Universe Exploit"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 45.000

InfiniteStamina.Name = "Infinite Stamina"
InfiniteStamina.Parent = Main
InfiniteStamina.BackgroundColor3 = Color3.fromRGB(0, 38, 255)
InfiniteStamina.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfiniteStamina.Position = UDim2.new(0.0581176504, 0, 0.232704625, 0)
InfiniteStamina.Size = UDim2.new(0, 300, 0, 50)
InfiniteStamina.Font = Enum.Font.TitilliumWeb
InfiniteStamina.Text = "INF Stamina"
InfiniteStamina.TextColor3 = Color3.fromRGB(0, 0, 0)
InfiniteStamina.TextSize = 50.000
InfiniteStamina.MouseButton1Click:Connect(function()
    InfiniteStaminabool = not InfiniteStaminabool
    print("infStamina-", InfiniteStaminabool)
    while InfiniteStaminabool do
        wait()
        infStamina()    
    end
end)

AutoSack.Name = "Auto Sack"
AutoSack.Parent = Main
AutoSack.BackgroundColor3 = Color3.fromRGB(0, 38, 255)
AutoSack.BorderColor3 = Color3.fromRGB(0, 0, 0)
AutoSack.Position = UDim2.new(0.057885766, 0, 0.409252644, 0)
AutoSack.Size = UDim2.new(0, 300, 0, 50)
AutoSack.Font = Enum.Font.TitilliumWeb
AutoSack.Text = "Auto Sack"
AutoSack.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoSack.TextSize = 50.000
AutoSack.MouseButton1Click:Connect(function()
    AutoSackbool = not AutoSackbool
    print("AutoSack-", AutoSackbool)
    while AutoSackbool do
        AutoSacks()
        wait(1)
    end
end)

SuperSpeed.Name = "Super Speed"
SuperSpeed.Parent = Main
SuperSpeed.BackgroundColor3 = Color3.fromRGB(0, 38, 255)
SuperSpeed.BorderColor3 = Color3.fromRGB(0, 0, 0)
SuperSpeed.Position = UDim2.new(0.057885766, 0, 0.587188601, 0)
SuperSpeed.Size = UDim2.new(0, 300, 0, 50)
SuperSpeed.Font = Enum.Font.TitilliumWeb
SuperSpeed.Text = "Super Speed"
SuperSpeed.TextColor3 = Color3.fromRGB(0, 0, 0)
SuperSpeed.TextSize = 45.000
SuperSpeed.MouseButton1Click:Connect(function()
    SuperSpeedbool = not SuperSpeedbool
    print("SuperSpeed-", SuperSpeedbool)
    if SuperSpeedbool then
        while SuperSpeedbool do
            superSpeed()
            wait()
        end
    end
    ply.Character.Humanoid.WalkSpeed = 16
end)

RemoveJumpDelay.Name = "RemoveJumpDelay"
RemoveJumpDelay.Parent = Main
RemoveJumpDelay.BackgroundColor3 = Color3.fromRGB(0, 38, 255)
RemoveJumpDelay.BorderColor3 = Color3.fromRGB(0, 0, 0)
RemoveJumpDelay.Position = UDim2.new(0.057885766, 0, 0.765124559, 0)
RemoveJumpDelay.Size = UDim2.new(0, 300, 0, 50)
RemoveJumpDelay.Font = Enum.Font.TitilliumWeb
RemoveJumpDelay.Text = "Remove Jump Delay"
RemoveJumpDelay.TextColor3 = Color3.fromRGB(0, 0, 0)
RemoveJumpDelay.TextSize = 45.000
RemoveJumpDelay.MouseButton1Click:Connect(function()
    removeJumpDelaybool = not removeJumpDelaybool
    print("removeJumpDelay-", removeJumpDelaybool)
    while removeJumpDelaybool do
        wait()
        removeJumpDelay()
    end
end)
