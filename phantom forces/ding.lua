local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Swindle315/dahub/main/MainFrame')))()
local Window = OrionLib:MakeWindow({Name = "Name = "Head$hot | Phantom Forces ",IntroText = "Head$hot"})
local rs = game:GetService("RunService")
local tweenService = game:GetService("TweenService")

-- FUNCTION

local function getTeam()
    local localPlayerGhostsTeamName = "Ghosts" 
    local playerFolderGhostsTeamName = "Bright orange" 
    local playerFolderPhantomsTeamName = "Bright blue" 
    
    if game.Players.LocalPlayer.Team.Name == localPlayerGhostsTeamName then return playerFolderPhantomsTeamName else return playerFolderGhostsTeamName end
end

local function getRandom()
    return Color3.new(math.random(),math.random(),math.random())
end

-- RAGE

_G.SilentAim={
    Enabled=false,--true,false  set to true to enable silent aim
    Target="All",--All,Head,Torso,Left Leg,Right Leg,Left Arm,Right Arm  target for silent aim (due to the shittyness of the script it probly will just hit the legs or torso)
    Auto_Shoot=false,--true,false  automaticly shoots when a play is in your fov 
    Auto_Wall=false,--true,false  automaticly targets players if they cna be penetrated by gun (may break with attachments)
    Fov=50,--0-inf  set fov size
    Show_Fov=false,--true,false   show fov circle
    Fov_Color= Color3.fromRGB(255,255,255),--rgb  circle color
    Ignore_Fov=false,--true,false  disable or enable fov chck
}

local Rage = Window:MakeTab({
    Name = "Rage",
    Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Rage:AddToggle({
	Name = "Silent Aim",
	Default   = false,
	Callback = function(Value)
		_G.SilentAim.Enabled=Value
	end    
})

Rage:AddToggle({
	Name = "Auto Shoot",
	Default   = false,
	Callback = function(Value)
		_G.SilentAim.Auto_Shoot = Value
	end    
})

Rage:AddToggle({
	Name = "Auto Wall",
	Default = false,
	Callback = function(Value)
        _G.SilentAim.Auto_Wall = Value
	end    
})

Rage:AddToggle({
    Name = "Show Fov",
    Default   = false,
    Callback = function(Value)
        _G.SilentAim.Show_Fov = Value
    end
})

Rage:AddToggle({
    Name = "Ignore FOV",
    Default   = false,
    Callback = function(Value)
        _G.SilentAim.Ignore_Fov = Value
    end
})

Rage:AddSlider({
    Name = "FOV Slider",
	Min = 1,
	Max = 1000,
	Default = 100,
	Color = Color3.new(0,0,0),
	Increment = 1,
	ValueName = "FOV",
	Callback = function(Value)
		_G.SilentAim.Fov = Value
	end    
})

Rage:AddColorpicker ({
    Name = "FOV Color",
    Default = Color3.fromRGB(255,0,0),
    Callback = function(Value)
        _G.SilentAim.Fov_Color = Value
    end
})

if _G.SilentAim.Target=="All"then
    _G.SilentAim.Target={"Head","Torso","Left Leg","Right Leg","Left Arm","Right Arm"}
else 
    _G.SilentAim.Target={_G.SilentAim.Target}
end
if _G.SilentWall then return else _G.SilentWall="you would not belive how long it took to code auto wall with tihs new update"end
local IsAlive=function()--check if player is alive
    if game.Players.LocalPlayer.Character and not game.Workspace:FindFirstChild("MenuLobby")then
        return true
    end
    return false
end
local NotGuns={"ONE HAND BLUNT","TWO HAND BLADE","EQUIPMENT","FRAGMENTATION","IMPACT","ONE HAND BLADE","TWO HAND BLUNT","HIGH EXPLOSIVE"}--production folder >:)
local guns={}--gun table
--V gun pen depths (cannot get these without decompiling modules so i added this)
local gunpendepths={None=0,["M14 BR"]=1.8,HK417=1.6,L22=0.9,["HECATE II"]=10,["M79 THUMPER"]=0.5,["AS VAL"]=1,MP1911=0.5,["GI M1"]=1,["TEC-9"]=0.5,GSP=0.1,["GLOCK 18"]=0.5,["GB-22"]=0.5,X95R=1,M16A3=1.2,["SCAR SSR"]=2.6,["STEYR SCOUT"]=3,K2=1,MG36=1.8,["AUTO 9"]=1,MP5SD=0.5,MAC10=0.5,UZI=0.7,["COLT MARS"]=1.5,["SAIGA-12U"]=0.4,["FAL PARA SHORTY"]=1.4,L115A3=3,MP40=1.1,["AN-94"]=1,["ARM PISTOL"]=0.9,BLOCKSON=0.5,MP5K=0.5,["MAKAROV PM"]=0.5,["L86 LSW"]=1.6,AK12=1,["BOXY BUSTER"]=0,["BEOWULF ECR"]=1.9,EXECUTIONER=1,["DRAGUNOV SVU"]=2.8,M16A4=1.2,M1903=5,["TOMMY GUN"]=0.5,["SCAR-H"]=1.5,G36K=1.1,AK74=1,JURY=1,["1858 CARBINE"]=0.5,["GLOCK 40"]=0.8,["BEOWULF TCR"]=3,["1858 NEW ARMY"]=0.5,M4=1,["NTW-20"]=20,HK51B=1,9,C8A2=0.8,MP7=1.5,AK47=1.4,MC51SD=1.5,KRINKOV=0.9,["GOLDEN ZIP 22"]=0.5,["KAC SRR"]=1,["TRG-42"]=3,["KRISS VECTOR"]=0.5,["RAMA 1130"]=0.5,["SR-3M"]=1,["SCAR PDW"]=0.9,["FAL 50.63 PARA"]=2,["E SHOTGUN"]=0.5,M1911=0.5,["AG-3"]=2,M231=1,K7=0.5,AKM=1.4,SKS=1.5,K1A=0.75,["GYROJET MARK I"]=0.5,["M14 DMR"]=2.4,["MICRO UZI"]=0.5,["PPSH-41"]=1,["REMINGTON 870"]=0.5,["VSS VINTOREZ"]=1.5,MK11=1.7,MSG90=2,["SL-8"]=1.3,M3A1=0.5,["GLOCK 17"]=0.5,["SASS 308"]=2,FT300=3,RPK74=1.6,["KS-23M"]=0.7,["AA-12"]=0.3,M7644=0.5,ALIEN=0.5,["TAR-21"]=1.2,["SCAR HAMR"]=1.4,MG3KWS=2,["GOLDEN HK51B"]=0.3,HK21=1.6,MG42=2.5,["AUG A3"]=1,["SA58 SPR"]=2,["BFG 50"]=10,["SAIGA-12"]=.5,AKU12=1,["FAL 50.00"]=2,FAMAS=1,["TYPE 88"]=.9,["REDHAWK 44"]=1,GRIZZLY=1.3,["COLT LMG"]=1.4,MP10=0.5,RAILGUN=200,["HENRY 45-70"]=2,["MP412 REX"]=.5,WA2000=2.8,["DEAGLE 44"]=1,["GLOCK 50"]=1,["GLOCK 21"]=0.7,HARDBALLER=1.2,M4A1=1,M9=0.5,["GOLDEN TOMMY GUN"]=0.5,["GOLDEN REDHAWK 45"]=0.5,["SCAR-L"]=1,["STG-44"]=1.6,P90=2,["DEAGLE 50"]=1.3,MP5=0.5,["AUG A3 PARA"]=0.5,["TOY M1911"]=0,["REMINGTON 700"]=3,["PP-2000"]=1,["MP5/10"]=0.8,AK12BR=2,["KG-99"]=0.5,UMP45=1.4,["ZIP 22"]=0.5,["GLOCK 1"]=0.5,C7A2=0.9,["SERBU SHOTGUN"]=0.6,["AUG A1"]=1,["COLT SMG 635"]=0.5,RPK12=1.6,["FIVE SEVEN"]=1.5,["DT11 PRO"]=.7,["GYROJET CARBINE"]=0.7,["OTs-126"]=1.2,M93R=0.5,DBV12=0.5,M45A1=0.5,["SAWED OFF"]=0.6,G36C=1,["SFG 50"]=10,["E GUN"]=0.5,SKORPION=0.5,OBREZ=2,RPK=1.8,["ROPOD SHOTTY"]=1.5,M41A=1,["GROZA-1"]=1.5,["GOLDEN SHORTY"]=0.1,["GROZA-4"]=1.5,M2011=0.5,["GLOCK 23"]=0.8,["KSG 12"]=0.4,["USAS-12"]=0.3,M60=3,["MOSIN NAGANT"]=4,["HONEY BADGER"]=1.3,["SPAS-12"]=0.6,["AM III"]=1.2,["STEVENS DB"]=0.5,["DRAGUNOV SVDS"]=3.2,["AUG HBAR"]=1.6,K14=3,["CAN CANNON"]=1.2,["AUG A2"]=1,AK103=1.4,AWS=2,INTERVENTION=6,["X95 SMG"]=0.7,["MATEBA 6"]=1,JUDGE=1,G36=1.3,["PP-19 BIZON"]=0.5,M107=10,G3=1.5,["GOLDEN DEAGLE 50"]=1.5,AK12C=1.2,L2A3=1.1,["GOLDEN DEAGLE 2"]=1.5,ASMI=0.5,["IZHEVSK PB"]=0.5,AK105=1,M3822=0.5,L85A2=1.2,["HOWA TYPE 20"]=1.4,HK416=1,M16A1=0.8,G11K2=2}
local StringToTable=function(string)--string to table function used in find broken module penetratrion
    local a={}
    for i=1,string.len(string)do
        a[#a+1]=string.sub(string,i,i)
    end
    return a
end
local FindBrokenModulePenetration=function(modulescript)--find broken module penetratrion used in new updates
    local gundata=decompile(modulescript)--you cant require anymore
    local exists,penstart=string.find(gundata,"v1.penetrationdepth = ")
    if not exists then return 0 end
    local pendata=string.sub(gundata,penstart,penstart+4)
    local number=""
    for _,v in pairs(StringToTable(pendata))do
        if tonumber(v)or v=="."then
            number=number..v
        end
    end
    return tonumber(number)
end
local weapondata={}--my shitty gun detection (it works fuck u)
for _,v in pairs(game:GetService("ReplicatedStorage").Content.ProductionContent.WeaponDatabase:GetChildren())do
    for _,c in pairs(v:GetChildren())do
        if c:FindFirstChild("Main")then
            weapondata[c.Name]={Union={},MeshPart={}}
            for _,x in pairs(c.Main:GetChildren())do
                if x:IsA("MeshPart")then
                    weapondata[c.Name].MeshPart[x.MeshId]=x.MeshId
                elseif x:IsA("Union")then
                    weapondata[c.Name].Union[x.AssetId]=x.AssetId
                end
            end
        end
    end
    if not table.find(NotGuns,v.Name)then
        for _,c in pairs(v:GetChildren())do
            guns[c]=c.Name
        end
    end
end
for i,v in pairs(guns)do--if there is a new update it will detect the weapons and try to add the new penetratrion depths
    if not gunpendepths[v]then
        local depth=FindBrokenModulePenetration(i[v])
        gunpendepths[v]=depth
        print("Error, Missing "..v..", Error Depth Recovery Found "..depth.." As Penetration, Please Contact The Dev To Fix https://discord.gg/vQQqcgBWCG")
    end
end
local GetGunName=function()--get weapon from closest model from camera?! omg shut up ik its stupid but it works quit bullying me
    if not IsAlive()then return"None"end
    local curdata={Union={},MeshPart={}}
    for _,v in pairs(game.Workspace.CurrentCamera.Main:GetChildren())do
        if v:IsA("MeshPart")then
            curdata.MeshPart[v.MeshId]=v.MeshId
        elseif v:IsA("Union")then
            curdata.Union[v.AssetId]=v.AssetId
        end
    end
    local matches={}
    for i,v in pairs(weapondata)do
        for i2,c in pairs(v)do
            for _,x in pairs(c)do
                if x==curdata[i2][x]then
                    if matches[i]then
                        matches[i]=matches[i]+1
                    else
                        matches[i]=1
                    end
                end
            end
        end
    end
    local a=0
    local closest="None"
    for i,v in pairs(matches)do
        if v>a then
            a=v
            closest=i
        end
    end
    return closest
end
local GetEnemys=function()--simple ass get enemys
    local players={}
    local characters={}
    local enemyteam
    for _,v in pairs(game.Players:GetChildren())do
        if v.Team~=game.Players.LocalPlayer.Team then
            enemyteam=tostring(v.TeamColor)
            players[#players+1]=v
        end
    end
    if not enemyteam then
        enemyteam="Bright orange"
        if game.Players.LocalPlayer.Team.Name=="Ghosts"then
            enemyteam="Bright blue"
        end
    end
    for _,v in pairs(game.Workspace.Players[enemyteam]:GetChildren())do
        characters[#characters+1]=v
    end
    return{characters,players}
end
local GetDirChange=function()--get bullet direction changes
    local a={}
    if game.Workspace.CurrentCamera:FindFirstChild("Main")then
        for _,v in pairs(game.Workspace.CurrentCamera.Main:GetChildren())do
            if string.find(string.lower(tostring(v)),"flame")or string.find(string.lower(tostring(v)),"sightmark")then
                a[#a+1]=v
            end
        end
    end
    return a
end
local Ignore={game.Workspace.CurrentCamera,game.Workspace.Ignore}--old ignore stuff (still works lul)
local function CanSee(Target,Penetrate,PenDepth)
    if not Penetrate then PenDepth=0 end
    local Dir=Target.Position-game.Workspace.CurrentCamera.CFrame.Position
    local InitCast=game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(game.Workspace.CurrentCamera.CFrame.Position,Dir),Ignore,false,true)
    if not InitCast then
        return true
    end
    local Penetrated=0
    for _,v in pairs(game.Workspace.CurrentCamera:GetPartsObscuringTarget({Target.Position},Ignore))do
        if v.CanCollide and v.Transparency~=1 and v.Name~="Window"then
            local MaxExtent=v.Size.Magnitude*Dir.Unit;
            local _,Enter=game.Workspace:FindPartOnRayWithWhitelist(Ray.new(game.Workspace.CurrentCamera.CFrame.Position,Dir),{v},true)
            local _,Exit=game.Workspace:FindPartOnRayWithWhitelist(Ray.new(Enter+MaxExtent,-MaxExtent),{v},true)
            local Depth=(Exit-Enter).Magnitude;
            if Depth>PenDepth then
                return false;
            else
                Penetrated=Penetrated+Depth;
            end
        else
            table.insert(Ignore,v)
        end
    end
    return Penetrated<PenDepth
end
local istyping=false--auto shoot bs
game.UserInputService.InputBegan:Connect(function(_,typing)
    istyping=typing
end)
game.UserInputService.InputEnded:Connect(function(_,typing)
    istyping=typing
end)
local target
local mouseisdown=false
game.RunService.RenderStepped:Connect(function()
    target=nil--reset targets
    if _G.SilentAim.Enabled and IsAlive()then--are we alive and enabled?
        local a=math.huge
        local penetratrion=gunpendepths[GetGunName()]
        for _,v in pairs(GetEnemys()[1])do--get characters
            for _,c in pairs(_G.SilentAim.Target)do--get part target list
                local main=v[c]--part to detect
                local mainmag=(main.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude--distance between us
                if _G.SilentAim.Ignore_Fov then--is ignoring fov
                    if mainmag<a and CanSee(main,_G.SilentAim.Auto_Wall,penetratrion)then
                        a=mainmag
                        target=main
                    end
                else--i dont wanna explain the lower part just figure it out
                    local center=game.Workspace.CurrentCamera:WorldToViewportPoint(game.Workspace.CurrentCamera.CFrame.Position+game.Workspace.CurrentCamera.CFrame.LookVector)
                    local partloc,isvisible=game.Workspace.CurrentCamera:WorldToScreenPoint(main.Position)
                    if --[[isvisible and]](Vector2.new(partloc.X,partloc.Y)-Vector2.new(center.X,center.Y)).Magnitude<=_G.SilentAim.Fov then
                        if mainmag<a and CanSee(main,_G.SilentAim.Auto_Wall,penetratrion)then
                            target=main
                            a=mainmag
                        end
                    end
                end
            end
        end
        if target then--have we has target :D
            for _,v in pairs(GetDirChange())do--our direction changes >:)
                v.Position=game.Workspace.CurrentCamera.CFrame.Position
                v.Velocity=Vector3.new()--because we remove welds later >:)
                local weld=v:FindFirstChildWhichIsA("Weld")or v:FindFirstChildWhichIsA("WeldConstraint")
                if weld then
                    weld:Destroy()--remove weld to remove swat to affecte accuracy
                end
                local x,y,z=CFrame.new(v.Position,target.Position+Vector3.new(0,.45--[[add half a block ofheigth because we can cause we can afford it]],0)):ToEulerAnglesYXZ()
                v.Orientation=Vector3.new(math.deg(x),math.deg(y),math.deg(z))--my very first silent aim i made came in handy LOL
            end
            if _G.SilentAim.Auto_Shoot and iswindowactive()and not istyping and not mouseisdown then
                coroutine.wrap(function()--so it dont bug out
                    mouse1press()--stoopid method for auto shoot but hey cant get require anymore so fuck it
                    mouseisdown=true
                    wait()
                    mouse1release()
                    mouseisdown=false
                end)()
            end
        else
            local straight=game.Workspace.CurrentCamera.CFrame.LookVector*100000
            for _,v in pairs(GetDirChange())do--fix bullet angle if we nolonger has target
                v.Position=game.Workspace.CurrentCamera.CFrame.Position
                v.Velocity=Vector3.new()--because we remove welds later >:)
                local weld = v:FindFirstChildWhichIsA("Weld") or v:FindFirstChildWhichIsA("WeldConstraint")
                if weld then
                    weld:Destroy()
                end
                local x,y,z=CFrame.new(v.Position,straight):ToEulerAnglesYXZ()
                v.Orientation=Vector3.new(math.deg(x),math.deg(y),math.deg(z))
            end
        end
    end
end)
coroutine.wrap(function()--our fov circle fuck you figure it out urself
    while wait(1) do
        pcall(function()
            if _G.SilentAim.Enabled and _G.SilentAim.Show_Fov and not _G.SilentAim.Ignore_Fov then
                local center=game.Workspace.CurrentCamera:WorldToViewportPoint(game.Workspace.CurrentCamera.CFrame.Position+game.Workspace.CurrentCamera.CFrame.LookVector)
                local a=Drawing.new("Circle")
                a.Visible=true
                a.Position=Vector2.new(center.X,center.Y)
                a.Color=_G.SilentAim.Fov_Color
                a.Thickness=2.5
                a.Transparency=1
                a.NumSides=100
                a.Radius=_G.SilentAim.Fov
                coroutine.wrap(function()
                    wait(1.1)
                    a:Remove()
                end)()
            end
        end)
    end
end)()

-- LEGIT

local Legit = Window:MakeTab({
	Name = "Legit",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- ESP
local EspColor = Color3.fromRGB(255,128,128) -- This is the colour of the ESP
local weaponColor = Color3.fromRGB(255,255,255)

local LineList = {}
local width = 3
local height = 5

local ESP = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

ESP:AddToggle({
	Name = "ESP",
	Default = false,
	Callback = function(Value)
        if Value then 
            LineList = {}
            espLoop = rs.RenderStepped:Connect(function()
                for i,v in pairs(LineList) do
                    if v then
                        v:Remove()
                    end
                end
                
                local team = getTeam()

                LineList = {}
                if game.Workspace.Players:FindFirstChild(team) then
                    for i,v in pairs(game.Workspace.Players:FindFirstChild(team):GetChildren()) do
                        local pos = v.PrimaryPart.Position
                        local ScreenSpacePos, IsOnScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(pos)
                        
                        a = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Torso.CFrame:PointToWorldSpace(Vector3.new(width/2, height/2, 0)))
                        b = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Torso.CFrame:PointToWorldSpace(Vector3.new(-width/2, height/2, 0)))
                        c = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Torso.CFrame:PointToWorldSpace(Vector3.new(-width/2, -height/2, 0)))
                        d = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Torso.CFrame:PointToWorldSpace(Vector3.new(width/2, -height/2, 0)))
                        
                        a = Vector2.new(a.X, a.Y)
                        b = Vector2.new(b.X, b.Y)
                        c = Vector2.new(c.X, c.Y)
                        d = Vector2.new(d.X, d.Y)
                        
                        if IsOnScreen then
                            local Line = Drawing.new("Quad")
                            Line.Visible = true
                            Line.PointA = a
                            Line.PointB = b
                            Line.PointC = c
                            Line.PointD = d
                            Line.Color = EspColor
                            Line.Thickness = 2
                            Line.Transparency = 1
                            
                            LineList[#LineList+1] = Line
                        end
                    end
                end
            end)
        else
            if espLoop ~= nil then
                espLoop:Disconnect()
                for i,v in pairs(LineList) do
                    v:Remove()
                end
                LineList = {}
            end
        end
        -- This is the actual esp that draws the lines and that
    end
})

ESP:AddColorpicker ({
    Name = "ESP Color",
    Default = Color3.fromRGB(255,0,0),
    Callback = function(Value)
        EspColor = Value
    end
})

local chamsMaterial = "Plastic"
local chamsColor = Color3.fromRGB(255,255,255)
local randomColor = false
local chamsTransparency = 0
local parts = {}

ESP:AddToggle({
    Name = "Weapon Chams",
    Default = false,
    Callback = function(Value)
        if Value then
            chamsStep = game.RunService.RenderStepped:Connect(function()
                for _,v in pairs(game.Workspace.CurrentCamera:GetDescendants()) do
                    if v:IsA("BasePart") and v.Transparency ~= 1 then -- save v in parts table, something like parts[v] = {v.Transparency, v.Color, v.Material}
                        if parts[v] == nil then
                            parts[v] = {v,v.Transparency, v.Color, v.Material}
                        end 
                        local tween = tweenService:Create(v,TweenInfo.new(0.5),{Color = chamsColor})
                        v.Transparency = chamsTransparency
                        v.Material = chamsMaterial
                        tween:Play()
                        if v:FindFirstChildWhichIsA("SpecialMesh")then
                            v.Transparency = 0.8
                        end
                    end
                    if v:IsA("MeshPart")then
                        v.TextureID = ""
                    end
                    if v:IsA("UnionOperation")then
                        v.UsePartColor = true
                    end
                end
            end)
        else 
            if chamsStep ~= nil then-- Idea for setting back to normal
                chamsStep:Disconnect()
                for k,v in pairs(parts) do
                    local tween = tweenService:Create(v[1],TweenInfo.new(0.2),{Color = v[3]})
                    v[1].Transparency = v[2]
                    v[1].Material = v[4]
                    tween:Play()
                end
                table.clear(parts)
            end
        end
    end
})

ESP:AddDropdown({
    Name = "Weapon Material",
    Default = "Plastic",
    Options = {"Plastic","SmoothPlastic","Neon","Wood","WoodPlanks","Marble","Slate",
        "Concrete","Granite","Brick","Pebble","Cobblestone","CorrodedMetal","DiamondPlate",
        "Foil","Metal","Grass","Sand","Fabric","Ice","Glass","ForceField"},
    Callback = function(Value)
        chamsMaterial = Value
    end
})

ESP:AddToggle({
    Name = "Rainbow Chams",
    Default = false,
    Callback = function(Value)
        randomColor = Value
        while Value do
            wait(0.6)
            chamsColor = getRandom()
            if not randomColor then
                break   
            end
        end
    end
})

local xrayTrans = 0
local active = false

ESP:AddToggle({
    Name = "Xray",
    Default = false,
    Callback = function(Value)
        active = Value
        while Value do
            wait()
            for _,v in pairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
                    v.Transparency = xrayTrans
                end
            end
            if active then
                break
            end
        end
        for _,v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
                v.Transparency = 0
            end
        end
    end
})

ESP:AddSlider({
    Name = "Xray Transparency",
	Min = 0,
	Max = 0.9,
	Default = 0.1,
	Color = Color3.new(0,0,0),
	Increment = 0.1,
	ValueName = "Transparency",
	Callback = function(Value)
		xrayTrans = Value
	end    
})

ESP:AddColorpicker ({
    Name = "Chams Color",
    Default = Color3.fromRGB(255,255,255),
    Callback = function(Value)
        if randomColor then return end
        chamsColor = Value
    end
})

ESP:AddSlider({
    Name = "Chams Transparency",
	Min = 0,
	Max = 0.9,
	Default = 0.5,
	Color = Color3.new(0,0,0),
	Increment = 0.1,
	ValueName = "Transparency",
	Callback = function(Value)
		chamsTransparency = Value
	end    
})

-- Anti Aim

local AA = Window:MakeTab({
	Name = "Anti-Aim",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Misc

-- Functions

local flyStep

function Fly_Balls(enabled)
    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    
    local CurrentCamera = workspace.CurrentCamera
    
    local LocalPlayer = Players.LocalPlayer
    
    local Boolean = true
    local Speed = 50

    local MovementTable = {
        0,
        0,
        0,
        0,
        0,
        0
    }
    local KeyCodeTable = {
        [Enum.KeyCode.W] = 1,
        [Enum.KeyCode.A] = 2,
        [Enum.KeyCode.S] = 3,
        [Enum.KeyCode.D] = 4,
        [Enum.KeyCode.LeftControl] = 5,
        [Enum.KeyCode.Space] = 6
    }

    UserInputService.InputBegan:Connect(function(Input, ...)
        if Input.KeyCode == Enum.KeyCode.F then
            if Boolean then
                Boolean = false
            else
                Boolean = true
            end
        elseif Input.KeyCode == Enum.KeyCode.LeftShift then
            Speed = 100
        elseif KeyCodeTable[Input.KeyCode] then
            MovementTable[KeyCodeTable[Input.KeyCode]] = 1
        end
    end)
    
    UserInputService.InputEnded:Connect(function(Input, ...)
        if Input.KeyCode == Enum.KeyCode.LeftShift then
            Speed = 50
        elseif KeyCodeTable[Input.KeyCode] then
            MovementTable[KeyCodeTable[Input.KeyCode]] = 0
        end
    end)
    
    local GetMass = function(Model)
        local Mass = 0
        for _, Value in pairs(Model:GetDescendants()) do
            if Value:IsA("BasePart") then
                Mass = Mass + Value:GetMass()
            end
        end
        return Mass * workspace.Gravity
    end
    
    if enabled then
        flyStep = RunService.RenderStepped:Connect(function(...)
            local Character = LocalPlayer.Character
            if Character then
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                local Mass = GetMass(Character)
                if HumanoidRootPart then
                    local BodyVelocity = HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")
                    if BodyVelocity then
                        if Boolean then
                            BodyVelocity.MaxForce = Vector3.new(Mass * Speed, Mass * Speed, Mass * Speed)
                            BodyVelocity.Velocity = CurrentCamera.CFrame.LookVector * Speed * (MovementTable[1] - MovementTable[3]) + CurrentCamera.CFrame.RightVector * Speed * (MovementTable[4] - MovementTable[2]) + CurrentCamera.CFrame.UpVector * Speed * (MovementTable[6] - MovementTable[5])
                        else
                            BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
                            BodyVelocity.Velocity = Vector3.new(0, 2, 0)
                        end
                    end
                end
            end
        end)
    else
        if flyStep ~= nil then
            flyStep:Disconnect()
            return
        end
    end
end 

_G.FullBrightEnabled = false

_G.NormalLightingSettings = {
    Brightness = game:GetService("Lighting").Brightness,
    ClockTime = game:GetService("Lighting").ClockTime,
    FogEnd = game:GetService("Lighting").FogEnd,
    GlobalShadows = game:GetService("Lighting").GlobalShadows,
    Ambient = game:GetService("Lighting").Ambient
}

game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
    if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
        _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
        if not _G.FullBrightEnabled then
            repeat
                wait()
            until _G.FullBrightEnabled
        end
        game:GetService("Lighting").Brightness = 1
    end
end)

game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
    if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
        _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
        if not _G.FullBrightEnabled then
            repeat
                wait()
            until _G.FullBrightEnabled
        end
        game:GetService("Lighting").ClockTime = 12
    end
end)

game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
    if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
        _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
        if not _G.FullBrightEnabled then
            repeat
                wait()
            until _G.FullBrightEnabled
        end
        game:GetService("Lighting").FogEnd = 786543
    end
end)

game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
    if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
        _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
        if not _G.FullBrightEnabled then
            repeat
                wait()
            until _G.FullBrightEnabled
        end
        game:GetService("Lighting").GlobalShadows = false
    end
end)

game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
    if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
        _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
        if not _G.FullBrightEnabled then
            repeat
                wait()
            until _G.FullBrightEnabled
        end
        game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
    end
end)

local LatestValue = true
spawn(function()
    repeat wait() until _G.FullBrightEnabled
    while wait() do
        if _G.FullBrightEnabled ~= LatestValue then
            if not _G.FullBrightEnabled then
                game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
            else
                game:GetService("Lighting").Brightness = 1
                game:GetService("Lighting").ClockTime = 12
                game:GetService("Lighting").FogEnd = 786543
                game:GetService("Lighting").GlobalShadows = false
                game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
            end
            LatestValue = not LatestValue
        end
    end
end)

local TeleportService = game:GetService("TeleportService")
local data = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Dsc&limit=100")).data

local c = 0
for i = 1, #data do
    local server = data[i-c]
    if not server.playing then
        table.remove(data, i-c)
        c = c + 1
    end
end

local function fyshuffle( tInput )
    local tReturn = {}
    for i = #tInput, 1, -1 do
        local j = math.random(i)
        tInput[i], tInput[j] = tInput[j], tInput[i]
        table.insert(tReturn, tInput[i])
    end
    return tReturn
end

data = fyshuffle(data)

local function randomhop(data, failed)
    failed = failed or {}
    for _, s in pairs(data) do
        local id = s.id
        if not failed[id] and id ~= game.JobId then
            if s.playing < s.maxPlayers then
                local connection
                connection = TeleportService.TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
                    connection:Disconnect()
                    failed[id] = true
                    randomhop(data, failed)
                end)
                TeleportService:TeleportToPlaceInstance(game.PlaceId, id)
                break
            end
        end
    end
end


local Misc = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Misc:AddToggle({
    Name = "Fly",
    Default = false,
    Callback = function(Value)
        Fly_Balls(Value)
    end
})

Misc:AddToggle({
    Name = "Fullbright",
    Default = false,
    Callback = function(Value)
        _G.FullBrightEnabled = Value
    end
})

local onrejoin 
Misc:AddToggle({
    Name = "Auto Rejoin",
    Default = false,
    Callback = function(Value)
        local overlay = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
        onrejoin = overlay.DescendantAdded:Connect(function(obj)
            if obj.Name == "ErrorMessage" then
                obj:GetPropertyChangedSignal("Text"):Connect(function()
                    if obj.Text:find("votekicked") and Value then
                        randomhop(data)
                    end
                end)
            end
        end)
    end
})

Misc:AddTextbox({
    Name = "Join Server ID",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        TeleportService:TeleportToPlaceInstance(game.PlaceId, Value)
    end
})

Misc:AddButton({
    Name = "Copy Server ID",
    Callback = function()
        setclipboard(game.JobId)
    end
})

Misc:AddButton({
    Name = "Remove Animations",
    Callback = function()
        syn.run_on_actor(getactors()[1], [[
            --Init
            if getgenv().connections and getgenv().connections["update"] then getgenv().connections["update"]:Disconnect() else getgenv().connections = {} end
            
            local Player = game:GetService("Players").LocalPlayer
            local Camera = game:GetService("Workspace").CurrentCamera
            local RunService = game:GetService("RunService")
            
            local require = getrenv().shared.require
            assert(require, "Missing shared.require")
            
            local network = require("network")
            local WeaponControllerInterface = require("WeaponControllerInterface")
            local MainCameraObject = require("MainCameraObject")
            local ReplicationObject = require("ReplicationObject")
            local ThirdPersonObject = require("ThirdPersonObject")
            local CharacterInterface = require("CharacterInterface")
            local PlayerDataStoreClient = require("PlayerDataStoreClient")
            local ContentDatabase = require("ContentDatabase")
            local GameGlock = require("GameClock")
            local ActiveLoadoutUtils = require("ActiveLoadoutUtils")
            
            assert(network, "Missing network")
            assert(WeaponControllerInterface, "Missing WeaponControllerInterface")
            assert(MainCameraObject, "Missing MainCameraObject")
            assert(ReplicationObject, "Missing ReplicationObject")
            assert(ThirdPersonObject, "Missing ThirdPersonObject")
            assert(CharacterInterface, "Missing CharacterInterface")
            assert(PlayerDataStoreClient, "Missing PlayerDataStoreClient")
            assert(ContentDatabase, "Missing ContentDatabase")
            assert(GameGlock, "Missing GameGlock")
            assert(ActiveLoadoutUtils, "Missing ActiveLoadoutUtils")
            
            local oldSetSway = MainCameraObject.setSway
            local oldShake = MainCameraObject.shake
            local oldSend = network.send
            local oldNewIndex
            
            local fakeRepObject = nil
            local controller = nil
            
            --Functions
            
            local function getActiveWeapon()
                if controller then
                    return controller.getActiveWeapon(controller)
                end
            end 
            local function getCurrentWeaponRegistry()
                if controller then
                    return controller._activeWeaponRegistry
                end
            end
            local function getWeaponData(Registry)
                if Registry._weaponData then
                    return Registry._weaponData
                end
            end
            
            --Gun Mods / Update
            
            getgenv().connections["update"] = RunService.RenderStepped:Connect(function()
                controller = WeaponControllerInterface.getController()
                if not controller then return end
                local registries = getCurrentWeaponRegistry()
            
                --Gun Mods
                for _,registry in pairs(registries) do
                    local weaponData = getWeaponData(registry)
                    setreadonly(weaponData, false)
            
                    --Instant Equip
                    if weaponData.equipspeed then weaponData.equipspeed = tick() end
            
                    --Instant Reload
                    if weaponData.animations then
                        for _,anim in pairs(weaponData.animations) do
                            if typeof(anim) == "table" then
                                if string.find(string.lower(_), "reload") then
                                    anim.timescale = 0
                                end
                            end
                        end
                    end
            
                    --Automatic Weapon
                    if weaponData.firemodes then weaponData.firemodes = { true } end
            
                    --No Recoil / No Spread
                    if weaponData.camkickmax then
                        local nvec = Vector3.new()
                        weaponData.camkickmin = nvec
                        weaponData.camkickmax = nvec
                        weaponData.aimcamkickmin = nvec
                        weaponData.aimcamkickmax = nvec
                        weaponData.aimtranskickmin = nvec
                        weaponData.aimtranskickmax = nvec
                        weaponData.transkickmin = nvec
                        weaponData.transkickmax = nvec
                        weaponData.rotkickmin = nvec
                        weaponData.rotkickmax = nvec
                        weaponData.aimrotkickmin = nvec
                        weaponData.aimrotkickmax = nvec
            
                        weaponData.hipfirespreadrecover = 100
                        weaponData.hipfirespread = 0
                        weaponData.hipfirestability = 0
                    end
                    setreadonly(weaponData, true)
                end
            end)
            
            MainCameraObject.setSway = function(self, a)
                return oldSetSway(self, 0)
            end
            MainCameraObject.shake = function(self, a)
                return oldShake(self, Vector3.zero)
            end
        ]])
    end
})

Misc:AddButton({
    Name = "Server Hop",
    Callback = function(Value)
        randomhop(data)
    end
})
