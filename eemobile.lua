local WindowTable = {}

function WindowTable:CreateWindow(name, gameName)
	for i,v in pairs(game.CoreGui:GetChildren()) do
		if v.Name == name then
			v:Destroy()
		end
	end
	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
		dragToggle = nil
		local dragSpeed = 0
		dragInput = nil
		dragStart = nil
		local dragPos = nil
		function updateInput(input)
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	
	
	local ScreenGui = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local Topbar = Instance.new("Frame")
	local title = Instance.new("TextLabel")
	local Close = Instance.new("TextButton")
	local Icon = Instance.new("ImageLabel")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local Line = Instance.new("Frame")
	local TabBar = Instance.new("Frame")
	local allTabs = Instance.new("Frame")
	local tabListing = Instance.new("UIListLayout")
	local allPages = Instance.new("Frame")
	local mainCorner = Instance.new("UICorner")
	local pagesFolder = Instance.new("Folder")
	
	ScreenGui.Name = name
	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = ScreenGui
	MainFrame.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.00373595441, 0, 0, 0)
	MainFrame.Size = UDim2.new(0, 486, 0, 476)

	Topbar.Name = "Topbar"
	Topbar.Parent = MainFrame
	Topbar.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	Topbar.BorderSizePixel = 0
	Topbar.Size = UDim2.new(0, 483, 0, 35)
	dragify(MainFrame)

	title.Name = "title"
	title.Parent = Topbar
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.Size = UDim2.new(0, 135, 0, 35)
	title.Font = Enum.Font.Arial
	title.Text = name.." | ".. gameName
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 15.000

	Close.Name = "Close"
	Close.Parent = Topbar
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.Position = UDim2.new(0.899177074, 0, 0, 0)
	Close.Size = UDim2.new(0, 49, 0, 35)
	Close.Font = Enum.Font.SourceSans
	Close.Text = ""
	Close.TextColor3 = Color3.fromRGB(0, 0, 0)
	Close.TextSize = 14.000
	Close.MouseButton1Click:Connect(function()
		ScreenGui:Destroy()
	end)

	Icon.Name = "Icon"
	Icon.Parent = Close
	Icon.BackgroundTransparency = 1.000
	Icon.Position = UDim2.new(0.208333328, 0, 0.0571428575, 0)
	Icon.Size = UDim2.new(0.8125, 0, 0.885714293, 0)
	Icon.Image = "rbxassetid://7072725342"

	UIAspectRatioConstraint.Parent = Icon

	Line.Name = "Line"
	Line.Parent = Topbar
	Line.BackgroundColor3 = Color3.fromRGB(255, 59, 25)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 1, 0)
	Line.Size = UDim2.new(1, 0, 0, 1)
	
	TabBar.Name = "TabBar"
	TabBar.Parent = MainFrame
	TabBar.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	TabBar.BorderSizePixel = 0
	TabBar.Position = UDim2.new(-0.00130158104, 0, 0.075630255, 0)
	TabBar.Size = UDim2.new(0, 483, 0, 32)

	allTabs.Name = "allTabs"
	allTabs.Parent = TabBar
	allTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	allTabs.BackgroundTransparency = 1.000
	allTabs.Position = UDim2.new(0, 0, 0.0300006866, 0)
	allTabs.Size = UDim2.new(0, 486, 0, 31)


	tabListing.Name = "tabListing"
	tabListing.Parent = allTabs
	tabListing.FillDirection = Enum.FillDirection.Horizontal
	tabListing.SortOrder = Enum.SortOrder.LayoutOrder
	tabListing.VerticalAlignment = Enum.VerticalAlignment.Center
	tabListing.Padding = UDim.new(0, 2)

	allPages.Name = "allPages"
	allPages.Parent = MainFrame
	allPages.BackgroundColor3 = Color3.fromRGB(39, 42, 47)
	allPages.Position = UDim2.new(-0.00130158104, 0, 0.142469257, 0)
	allPages.Size = UDim2.new(0, 486, 0, 408)

	mainCorner.CornerRadius = UDim.new(0, 3)
	mainCorner.Name = "mainCorner"
	mainCorner.Parent = allPages

	pagesFolder.Name = "pagesFolder"
	pagesFolder.Parent = allPages
	
	local TabHandler = {}
	
	function TabHandler:CreateTab(tabname)
		tabname = tabname or "New Tab"
		local tabButton = Instance.new("TextButton")
		local tabCorner = Instance.new("UICorner")
		local newPage = Instance.new("ScrollingFrame")
		local elementsListing = Instance.new("UIListLayout")
		
		tabButton.Name = "tabButton"
		tabButton.Parent = allTabs
		tabButton.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
		tabButton.BackgroundTransparency = 0
		tabButton.Position = UDim2.new(0, 0, 0.0967741907, 0)
		tabButton.Size = UDim2.new(0, 71, 0, 25)
		tabButton.Font = Enum.Font.Gotham
		tabButton.Text = "Example"
		tabButton.TextColor3 = Color3.fromRGB(254, 254, 254)
		tabButton.TextSize = 14.000

		tabCorner.CornerRadius = UDim.new(0, 3)
		tabCorner.Name = "tabCorner"
		tabCorner.Parent = tabButton
		
		newPage.Name = "newPage"
		newPage.Parent = pagesFolder
		newPage.Active = true
		newPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		newPage.BackgroundTransparency = 1.000
		newPage.BorderSizePixel = 0
		newPage.Position = UDim2.new(0.00130158104, 0, 0, 0)
		newPage.Size = UDim2.new(0.998698413, 0, 1, 0)
		newPage.ScrollBarThickness = 5

		elementsListing.Name = "elementsListing"
		elementsListing.Parent = newPage
		elementsListing.HorizontalAlignment = Enum.HorizontalAlignment.Center
		elementsListing.SortOrder = Enum.SortOrder.LayoutOrder
		elementsListing.Padding = UDim.new(0, 5)
		
		tabButton.MouseButton1Click:Connect(function()
			for i,v in next, pagesFolder:GetChildren() do
				v.Visible = false
			end
			newPage.Visible = true

			for i,v in next, allTabs:GetChildren() do
				if v:IsA("TextButton") then
					game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						BackgroundColor3 = Color3.fromRGB(43, 43, 43)	
					}):Play()
				end
			end
			game.TweenService:Create(tabButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				BackgroundColor3 = Color3.fromRGB(39, 39, 39)
			}):Play()
		end)
		
		local ElementHandler = {}
		
		function ElementHandler:CreateButton(btnText, callback)
			btnText = btnText or "TextButton"
			callback = callback or function() end
			
			local TextButton = Instance.new("TextButton")
			local buttonCorner = Instance.new("UICorner")
			
			TextButton.Parent = newPage
			TextButton.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
			TextButton.Position = UDim2.new(-0.174636185, 0, -0.00616522785, 0)
			TextButton.Size = UDim2.new(0, 477, 0, 32)
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.Gotham
			TextButton.Text = "Button Example"
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.MouseButton1Click:Connect(function()
				callback()
			end)

			buttonCorner.CornerRadius = UDim.new(0, 3)
			buttonCorner.Name = "buttonCorner"
			buttonCorner.Parent = TextButton
			
			
		end
		
		function ElementHandler:CreateToggle(togInfo, callback)
			togInfo = togInfo or "NewToggle"
			callback = callback or function() end
			
			local toggleButton = Instance.new("TextButton")
			local toggleButtonCover = Instance.new("UICorner")
			local toggle = Instance.new("Frame")
			local toggleCorner = Instance.new("UICorner")
			local True = Instance.new("Frame")
			local Icon_2 = Instance.new("ImageLabel")
			local toggleInfo = Instance.new("TextLabel")
			
			toggleButton.Name = "toggleButton"
			toggleButton.Parent = newPage
			toggleButton.BackgroundColor3 = Color3.fromRGB(44, 48, 53)
			toggleButton.Position = UDim2.new(-0.195426196, 0, 0.0918114111, 0)
			toggleButton.Size = UDim2.new(0, 480, 0, 32)
			toggleButton.AutoButtonColor = false
			toggleButton.Font = Enum.Font.Gotham
			toggleButton.Text = ""
			toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			toggleButton.TextSize = 14.000

			toggleButtonCover.CornerRadius = UDim.new(0, 3)
			toggleButtonCover.Name = "toggleButtonCover"
			toggleButtonCover.Parent = toggleButton

			toggle.Name = "toggle"
			toggle.Parent = toggleButton
			toggle.BackgroundColor3 = Color3.fromRGB(61, 67, 74)
			toggle.Position = UDim2.new(0.0240549836, 0, 0.15625, 0)
			toggle.Size = UDim2.new(0, 22, 0, 22)

			toggleCorner.CornerRadius = UDim.new(0, 5)
			toggleCorner.Name = "toggleCorner"
			toggleCorner.Parent = toggle

			True.Name = "True"
			True.Parent = toggle
			True.BackgroundColor3 = Color3.fromRGB(255, 66, 53)
			True.Size = UDim2.new(0, 22, 0, 22)
			True.Visible = false

			Icon_2.Name = "Icon"
			Icon_2.Parent = True
			Icon_2.BackgroundTransparency = 1.000
			Icon_2.Size = UDim2.new(0, 22, 0, 22)
			Icon_2.Image = "rbxassetid://7072706620"

			toggleInfo.Name = "toggleInfo"
			toggleInfo.Parent = toggleButton
			toggleInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleInfo.BackgroundTransparency = 1.000
			toggleInfo.Position = UDim2.new(0.0951675326, 0, 0, 0)
			toggleInfo.Size = UDim2.new(0, 230, 0, 32)
			toggleInfo.Font = Enum.Font.Gotham
			toggleInfo.Text = "Toggle Example"
			toggleInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
			toggleInfo.TextSize = 14.000
			toggleInfo.TextXAlignment = Enum.TextXAlignment.Left
			
			local tog = false

			toggleButton.MouseButton1Click:Connect(function()
				tog = not tog
				callback(tog)
				if tog then
					True.Visible = true
				else
					True.Visible = false
				end
			end)
		end
		return ElementHandler
	end
	
	return TabHandler
end

return WindowTable
