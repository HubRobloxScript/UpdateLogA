-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Drag = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Update = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Drag.Name = "Drag"
Drag.Parent = ScreenGui
Drag.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
Drag.BorderColor3 = Color3.fromRGB(0, 0, 0)
Drag.BorderSizePixel = 0
Drag.Position = UDim2.new(0.37667945, 0, 0, 0)
Drag.Size = UDim2.new(0, 308, 0, 40)
Drag.Active = true

Frame.Parent = Drag
Frame.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(-0.00324635697, 0, 0.999691784, 0)
Frame.Size = UDim2.new(0, 308, 0, 233)
Drag.Active = true

Update.Name = "Update"
Update.Parent = Frame
Update.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
Update.BackgroundTransparency = 1.000
Update.BorderColor3 = Color3.fromRGB(0, 0, 0)
Update.BorderSizePixel = 0
Update.Size = UDim2.new(0, 308, 0, 233)
Update.Font = Enum.Font.SourceSansBold
Update.Text = "Nothing Yet"
Update.TextColor3 = Color3.fromRGB(0, 0, 0)
Update.TextSize = 30.000
Update.TextWrapped = true
Update.TextXAlignment = Enum.TextXAlignment.Left
Update.TextYAlignment = Enum.TextYAlignment.Top

TextLabel.Parent = Drag
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, -0.0250000004, 0)
TextLabel.Size = UDim2.new(0, 308, 0, 40)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Update Log"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

-- Scripts:

local function PZGHE_fake_script() -- Drag.SmoothDrag 
	local script = Instance.new('LocalScript', Drag)

	local Drag = script.Parent
	gsCoreGui = game:GetService("CoreGui")
	gsTween = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
		local dragging
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			local dragTime = 0.04
			local SmoothDrag = {}
			SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
			dragSmoothFunction:Play()
		end
		Drag.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = Drag.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		Drag.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging and Drag.Size then
				update(input)
			end
		end)
	
end
coroutine.wrap(PZGHE_fake_script)()
local function UTFIVO_fake_script() -- Drag.LocalScript 
	local script = Instance.new('LocalScript', Drag)

	wait(3)
	script.Parent.Parent.Drag.Visible = false
end
coroutine.wrap(UTFIVO_fake_script)()
