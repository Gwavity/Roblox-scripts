-- Gui to Lua
-- Version: 3.2

-- Instances:

local Main = Instance.new("ScreenGui")
local Main_2 = Instance.new("Frame")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Teleport = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local OpenList = Instance.new("TextButton")
local Locations = Instance.new("ScrollingFrame")
local DeleteLocation = Instance.new("TextButton")
local SavePosition = Instance.new("TextButton")
local PositionBox = Instance.new("TextBox")
local MainBar = Instance.new("Frame")
local X = Instance.new("TextButton")
local Universal = Instance.new("TextLabel")
local Frame_2 = Instance.new("Frame")
local Open_Menu = Instance.new("TextButton")
local httpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer
local gamePlace = tostring(game.PlaceId)
local scrollOpen = false
local posTable = {}
local locationButtons = {}
local selectedButton

--Properties:

Main.Name = "Main"
Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main_2.Name = "Main"
Main_2.Parent = Main
Main_2.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
Main_2.BorderColor3 = Color3.fromRGB(69, 41, 139)
Main_2.BorderSizePixel = 4
Main_2.Position = UDim2.new(0.707448363, 0, 0.580709219, 0)
Main_2.Size = UDim2.new(0, 336, 0, 251)

Frame.Parent = Main_2
Frame.BackgroundColor3 = Color3.fromRGB(69, 41, 139)
Frame.BorderColor3 = Color3.fromRGB(69, 41, 139)
Frame.Position = UDim2.new(0.263000011, 0, 0.75, 0)
Frame.Size = UDim2.new(0, 155, 0, 55)

UICorner.Parent = Frame

Teleport.Name = "Teleport"
Teleport.Parent = Frame
Teleport.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
Teleport.Position = UDim2.new(0.0149999997, 0, 0.0500000007, 0)
Teleport.Size = UDim2.new(0, 150, 0, 50)
Teleport.Font = Enum.Font.SourceSansBold
Teleport.Text = "Teleport"
Teleport.TextColor3 = Color3.fromRGB(69, 41, 139)
Teleport.TextScaled = true
Teleport.TextSize = 14.000
Teleport.TextWrapped = true

UICorner_2.Parent = Teleport

OpenList.Name = "Open List"
OpenList.Parent = Main_2
OpenList.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
OpenList.BorderColor3 = Color3.fromRGB(69, 41, 139)
OpenList.BorderSizePixel = 3
OpenList.Position = UDim2.new(0.0260000005, 0, 0.0299999993, 0)
OpenList.Size = UDim2.new(0, 160, 0, 26)
OpenList.Font = Enum.Font.SourceSansBold
OpenList.Text = "Open List"
OpenList.TextColor3 = Color3.fromRGB(69, 41, 139)
OpenList.TextScaled = true
OpenList.TextSize = 14.000
OpenList.TextWrapped = true

Locations.Name = "Locations"
Locations.Parent = Main_2
Locations.Active = true
Locations.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
Locations.BorderColor3 = Color3.fromRGB(69, 41, 139)
Locations.BorderSizePixel = 3
Locations.Position = UDim2.new(0.0265, 0, 0.15, 0)
Locations.Size = UDim2.new(0, 0, 0, 0)
Locations.Visible = false
Locations.CanvasSize = UDim2.new(0, 0, 8, 0)

DeleteLocation.Name = "Delete Location"
DeleteLocation.Parent = Main_2
DeleteLocation.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
DeleteLocation.BorderColor3 = Color3.fromRGB(69, 41, 139)
DeleteLocation.BorderSizePixel = 3
DeleteLocation.Position = UDim2.new(0.0260000005, 0, 0.579800785, 0)
DeleteLocation.Size = UDim2.new(0, 160, 0, 26)
DeleteLocation.Font = Enum.Font.SourceSansBold
DeleteLocation.Text = "Delete Location"
DeleteLocation.TextColor3 = Color3.fromRGB(69, 41, 139)
DeleteLocation.TextScaled = true
DeleteLocation.TextSize = 14.000
DeleteLocation.TextWrapped = true

SavePosition.Name = "Save Position"
SavePosition.Parent = Main_2
SavePosition.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
SavePosition.BorderColor3 = Color3.fromRGB(69, 41, 139)
SavePosition.BorderSizePixel = 3
SavePosition.Position = UDim2.new(0.542999983, 0, 0.58099997, 0)
SavePosition.Size = UDim2.new(0, 143, 0, 26)
SavePosition.Font = Enum.Font.SourceSansBold
SavePosition.Text = "Save Position"
SavePosition.TextColor3 = Color3.fromRGB(69, 41, 139)
SavePosition.TextScaled = true
SavePosition.TextSize = 14.000
SavePosition.TextWrapped = true

PositionBox.Name = "Position Box"
PositionBox.Parent = Main_2
PositionBox.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
PositionBox.BorderColor3 = Color3.fromRGB(69, 41, 139)
PositionBox.BorderSizePixel = 3
PositionBox.Position = UDim2.new(0.543, 0, 0.019, 0)
PositionBox.Size = UDim2.new(0, 143, 0, 138)
PositionBox.Font = Enum.Font.SourceSansBold
PositionBox.Text = ""
PositionBox.TextColor3 = Color3.fromRGB(69, 41, 139)
PositionBox.TextScaled = true
PositionBox.TextSize = 14.000
PositionBox.TextWrapped = true

MainBar.Name = "Main Bar"
MainBar.Parent = Main_2
MainBar.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
MainBar.BorderColor3 = Color3.fromRGB(69, 41, 139)
MainBar.BorderSizePixel = 4
MainBar.Position = UDim2.new(0, -0, 0, -30)
MainBar.Size = UDim2.new(0, 336, 0, 37)

X.Name = "X"
X.Parent = MainBar
X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
X.BackgroundTransparency = 1.000
X.Position = UDim2.new(0.91, 0, -0.19, 0)
X.Size = UDim2.new(0, 31, 0, 37)
X.Font = Enum.Font.SourceSansBold
X.Text = "X"
X.TextColor3 = Color3.fromRGB(69, 41, 139)
X.TextScaled = true
X.TextSize = 14.000
X.TextWrapped = true

Universal.Name = "Universal"
Universal.Parent = MainBar
Universal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Universal.BackgroundTransparency = 1.000
Universal.Position = UDim2.new(-0.013, 0, -0.05, 0)
Universal.Size = UDim2.new(0, 200, 0, 28)
Universal.Font = Enum.Font.SourceSansBold
Universal.Text = "Universal Teleport"
Universal.TextColor3 = Color3.fromRGB(69, 41, 139)
Universal.TextScaled = true
Universal.TextSize = 14.000
Universal.TextWrapped = true

Frame_2.Parent = Main
Frame_2.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
Frame_2.BorderColor3 = Color3.fromRGB(69, 41, 139)
Frame_2.BorderSizePixel = 3
Frame_2.Position = UDim2.new(0.00468750298, 0, 0.838746548, 0)
Frame_2.Size = UDim2.new(0, 100, 0, 33)

Open_Menu.Name = "Open_Menu"
Open_Menu.Parent = Frame_2
Open_Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Open_Menu.BackgroundTransparency = 1.000
Open_Menu.BorderColor3 = Color3.fromRGB(69, 41, 139)
Open_Menu.Position = UDim2.new(0.0299999621, 0, 0.0909090936, 0)
Open_Menu.Size = UDim2.new(0, 88, 0, 21)
Open_Menu.Font = Enum.Font.SourceSansBold
Open_Menu.Text = "Open Menu"
Open_Menu.TextColor3 = Color3.fromRGB(69, 41, 139)
Open_Menu.TextScaled = true
Open_Menu.TextSize = 14.000
Open_Menu.TextWrapped = true

local function convertToTable(json) 
	local table = {}
	for k,v in pairs(json) do
		table[k] = v
	end
	return table
end

local function convertStringTableToVector(json) 
	local table = {}
	local increment = 0
	for k,v in pairs(json[tostring(game.PlaceId)]) do
		table[k] = Vector3.new(v:match("(.+),(.+),(.+)"))
		increment = increment + 1
	end
	return table,increment
end

--Scripts:

local function MHGILO_fake_script() -- Teleport.Teleport_Script 
	local script = Instance.new('LocalScript', Teleport)
	
	local button = script.Parent
	
	button.Activated:Connect(function()
		if selectedButton and player then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(selectedButton[3])
		end
	end)
	
end
coroutine.wrap(MHGILO_fake_script)()

local function FVYQ_fake_script() -- OpenList.Open_Script 
	local script = Instance.new('LocalScript', OpenList)

	local button = script.Parent
	local menu = button.Parent.Locations
	local currentButton 

	button.MouseButton1Click:Connect(function()
		if not scrollOpen then-- Max options with these settings is 54
			local yPos = 0.002
			local JSONFile = readfile("SavedPositions.json")
			local json = httpService:JSONDecode(JSONFile)
			local jsonTable,length = convertStringTableToVector(json)

			if length <= 0 then return end
			menu.Visible = true
			menu:TweenSize(UDim2.new(.475,0,.45,0),Enum.EasingDirection.Out,Enum.EasingStyle.Sine,0.2,true)
			scrollOpen = true
			for k,v in pairs(jsonTable) do
				local button = Instance.new("TextButton")
				button.Parent = menu	
				button.Position = UDim2.new(-.016,0,yPos,0)
				button.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
				button.BorderColor3 = Color3.fromRGB(69, 41, 139)
				button.BorderSizePixel = 3
				button.BorderMode = Enum.BorderMode.Inset
				button.TextScaled = true
				button.TextColor3 = Color3.fromRGB(69, 41, 139)
				button.RichText = true	
				button.Size = UDim2.new(0, 150,0, 30)
				button.Text = "<b>"..k.."</b>"
				yPos = yPos + 0.018
				button.Activated:Connect(function()
					if currentButton and currentButton ~= button then
						currentButton.BorderColor3 = Color3.fromRGB(69, 41, 139)
						currentButton.TextColor3 = Color3.fromRGB(69, 41, 139)
					end
					currentButton = button
					currentButton.BorderColor3 = Color3.fromRGB(18, 58, 252)
					currentButton.TextColor3 = Color3.fromRGB(18, 58, 252)
					selectedButton = {button,k,v}
				end)
				table.insert(locationButtons, button)
			end
		else
			menu:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Sine,0.2,true)
			for k,v in pairs(locationButtons) do
				v:Destroy()
			end
			menu.Visible = false
			scrollOpen = false
		end
	end)
	
end
coroutine.wrap(FVYQ_fake_script)()

local function WJURIZ_fake_script() -- DeleteLocation.Delete_Script 
	local script = Instance.new('LocalScript', DeleteLocation)

	local button = script.Parent

	button.Activated:Connect(function()
		local increment = 0
		if selectedButton then
			posTable[gamePlace][selectedButton[2]] = nil
			selectedButton = nil
			Locations:TweenSize(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Sine,0.2,true)
			Locations.Visible = false
			scrollOpen = false
			for k,v in pairs(locationButtons) do
				v:Destroy()
			end
			writefile("SavedPositions.json",httpService:JSONEncode(posTable))
		end
		for k,v in pairs(posTable[gamePlace]) do
			increment = increment + 1
		end
		if increment == 0 then
			posTable[gamePlace] = nil
			writefile("SavedPositions.json",httpService:JSONEncode(posTable))
		end
	end)
	
end
coroutine.wrap(WJURIZ_fake_script)()

local function MQDIT_fake_script() -- SavePosition.Save_Script 
	local script = Instance.new('LocalScript', SavePosition)

	local button = script.Parent
	local originalText = button.Text
	local posBox = PositionBox
	local currentTime

	if isfile("SavedPositions.json") then
		local JSONFile = readfile("SavedPositions.json")
		local json = httpService:JSONDecode(JSONFile)
		local convertedTable = convertToTable(json)
		posTable = convertedTable
	end

	local function resetText()
		while true do
			wait()
			if os.time() - currentTime > 1 then
				button.Text = originalText
				return
			end
		end
	end

	button.Activated:Connect(function()
		if #posBox.Text < 1 then
			button.Text = "Please enter a name for your position"
			currentTime = os.time()
			coroutine.wrap(resetText)()
			return
		end
		local text = posBox.Text
		if posTable[gamePlace] then
			for k,v in pairs(posTable[gamePlace]) do
				if k == posBox.Text then
					button.Text = "Choose a name that you haven't used"
					currentTime = os.time()
					coroutine.wrap(resetText)()
					return
				end
			end
			posTable[gamePlace][posBox.Text] = tostring(player.Character.PrimaryPart.Position)
			writefile("SavedPositions.json",httpService:JSONEncode(posTable))
		else
			posTable[gamePlace] = {[posBox.Text] = tostring(player.Character.PrimaryPart.Position)}
			writefile("SavedPositions.json",httpService:JSONEncode(posTable))
		end
	end)
	
end
coroutine.wrap(MQDIT_fake_script)()

local function WJOROTY_fake_script() -- X.X_Script 
	local script = Instance.new('LocalScript', X)

	local button = script.Parent
	local main = button.Parent.Parent
	
	button.Activated:Connect(function()
		main.Visible = false
	end)
	
end
coroutine.wrap(WJOROTY_fake_script)()

local function QZAMATY_fake_script() -- MainBar.Bar Script 
	local script = Instance.new('LocalScript', MainBar)

	local UIS = game:GetService("UserInputService")
	
	local barFrame = script	.Parent
	local held = false
	local dragStart
	local startPos
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	
		barFrame.Parent.Position = position
	end
	
	barFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then 
			held = true
			dragStart = input.Position
			startPos = barFrame.Parent.Position
		end
	end)
	
	barFrame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then 
			held = false
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			if held then
				updateInput(input)
			end
		end
	end)
end
coroutine.wrap(QZAMATY_fake_script)()

local function ENTM_fake_script() -- Open_Menu.Open_Menu_Script 
	local script = Instance.new('LocalScript', Open_Menu)

	local button = script.Parent
	local main = button.Parent.Parent:FindFirstChild("Main")
	
	button.Activated:Connect(function()
		main.Visible = true
	end)
end
coroutine.wrap(ENTM_fake_script)()
