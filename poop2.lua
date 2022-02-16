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
	MainFrame.Position = UDim2.new(0.377552509, 0, 0.238461539, 0)
	MainFrame.Size = UDim2.new(0, 486, 0, 476)

	Topbar.Name = "Topbar"
	Topbar.Parent = MainFrame
	Topbar.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	Topbar.BorderSizePixel = 0
	Topbar.Size = UDim2.new(0, 486, 0, 35)
	dragify(Topbar)

	title.Name = "title"
	title.Parent = Topbar
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.Size = UDim2.new(0, 135, 0, 35)
	title.Font = Enum.Font.Arial
	title.Text = name.."| ".. gameName
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
	TabBar.Size = UDim2.new(0, 486, 0, 32)

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
	end
	
	return TabHandler
end

return WindowTable
