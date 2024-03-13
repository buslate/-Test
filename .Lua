--Cavehub build A Boat For Treasure

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Cave Hub 0.0.3",
    SubTitle = "by ! Chuck : chuck_007.",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Light",
    MinimizeKey = Enum.KeyCode.Home -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://11433532654" }),
    Team = Window:AddTab({ Title = "Change Team", Icon = "rbxassetid://12966835146" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "rbxassetid://11293977610" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Cave Hub NO.1",
        SubContent = "", -- Optional
        Duration = 10 -- Set to nil to make the notification not disappear
    })
end

--Tp To White
wait(.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56.871666, -9.69999123, -613.46759, -0.650971651, 7.14956316e-09, -0.759102046, -6.33533492e-09, 1, 1.4851345e-08, 0.759102046, 1.44769698e-08, -0.650971651)
--autoFarm

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "AutoFarm", Default = false })

Toggle:OnChanged(function(Value)
    _G.Farm = Value
    if _G.Farm then
    while _G.Farm do

        local targetPositions = {
                    Vector3.new(-47.2670097, 24.3890266, 134.851074, -0.999204457, 0.000584861089, 0.0398766696, -1.27346425e-10, 0.999892473, -0.0146651743, -0.0398809575, -0.0146535076, -0.99909699),
                    Vector3.new(-50.6572571, 52.024601, 609.441162, -0.999487579, -0.000145342638, 0.0320080779, -7.25439413e-12, 0.999989688, 0.00454076426, -0.0320084095, 0.00453843735, -0.999477267),
                    Vector3.new(-49.0358887, 44.6002235, 1283.07361, -0.999757111, -0.00103060459, 0.0220147371, 5.74352198e-11, 0.998906016, 0.0467630923, -0.0220388472, 0.0467517339, -0.998663366),
                    Vector3.new(-60.0339928, 44.2110901, 8675.1875),
                    Vector3.new(-56.3319244, -359.30011, 9495.98047),
                    -- Add more target positions as needed
                }
                
                local currentTargetIndex = 1
                
                local function teleportToNextTarget()
                    local targetPosition = targetPositions[currentTargetIndex]
                
                    -- Validate target position
                    if not targetPosition then
                        warn("Invalid target position at index", currentTargetIndex)
                        return
                    end
                
                    local distance = (targetPosition - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    local speed = 390 -- Adjust speed as desired
                    local duration = distance / speed
                
                    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
                    local tween = game:GetService("TweenService"):Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        tweenInfo,
                        {CFrame = CFrame.new(targetPosition)}
                    )
                    tween:Play()
                
                    tween.Completed:Connect(function()
                        currentTargetIndex += 1
                        teleportToNextTarget()
                            game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
                                wait(0) -- Wait for death animation to finish
                                currentTargetIndex = 1 -- Reset index to teleport back to the first position
                                teleportToNextTarget() -- Restart the loop
                            end)
                        end)
                    end
                teleportToNextTarget() -- Start the loop
                workspace:WaitForChild("ClaimRiverResultsGold"):FireServer()
                wait(50)
                end
    end
end)

Options.MyToggle:SetValue(false)

--autoFarm Box

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "AutoFarm GoldBox", Default = false })

Toggle:OnChanged(function(Value)
    _G.Farm = Value
    if _G.Farm then
    while _G.Farm do

        local targetPositions = {
                    Vector3.new(-47.2670097, 24.3890266, 134.851074, -0.999204457, 0.000584861089, 0.0398766696, -1.27346425e-10, 0.999892473, -0.0146651743, -0.0398809575, -0.0146535076, -0.99909699),
                    Vector3.new(-50.6572571, 52.024601, 609.441162, -0.999487579, -0.000145342638, 0.0320080779, -7.25439413e-12, 0.999989688, 0.00454076426, -0.0320084095, 0.00453843735, -0.999477267),
                    Vector3.new(-49.0358887, 44.6002235, 1283.07361, -0.999757111, -0.00103060459, 0.0220147371, 5.74352198e-11, 0.998906016, 0.0467630923, -0.0220388472, 0.0467517339, -0.998663366),
                    Vector3.new(-60.0339928, 44.2110901, 8675.1875),
                    Vector3.new(-56.3319244, -359.30011, 9495.98047),
                    -- Add more target positions as needed
                }
                
                local currentTargetIndex = 1
                
                local function teleportToNextTarget()
                    local targetPosition = targetPositions[currentTargetIndex]
                
                    -- Validate target position
                    if not targetPosition then
                        warn("Invalid target position at index", currentTargetIndex)
                        return
                    end
                
                    local distance = (targetPosition - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    local speed = 4100 -- Adjust speed as desired
                    local duration = distance / speed
                
                    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
                    local tween = game:GetService("TweenService"):Create(
                        game.Players.LocalPlayer.Character.HumanoidRootPart,
                        tweenInfo,
                        {CFrame = CFrame.new(targetPosition)}
                    )
                    tween:Play()
                
                    tween.Completed:Connect(function()
                        currentTargetIndex += 1
                        teleportToNextTarget()
                            game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
                                wait(0) -- Wait for death animation to finish
                                currentTargetIndex = 1 -- Reset index to teleport back to the first position
                                teleportToNextTarget() -- Restart the loop
                            end)
                        end)
                    end
                teleportToNextTarget() -- Start the loop
                workspace:WaitForChild("ClaimRiverResultsGold"):FireServer()
                wait(25)
                end
    end
end)

Options.MyToggle:SetValue(false)

--SmoothTween

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Part ฺBelow Character", Default = false })

Toggle:OnChanged(function(Value)
    do 
        local NM = game:GetService("Workspace"):FindFirstChild("Noclip")
        if NM then
            NM:Destroy()
        end
    end
    local Noclip = Instance.new("Part",Workspace)
        Noclip.Name = "Noclip"
        Noclip.CanCollide = true
        Noclip.Anchored = true
        Noclip.Transparency = 1
        Noclip.Size = Vector3.new(50, -5, 50)
    function Noclip()
        game:GetService("Workspace"):FindFirstChild("Noclip").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-4,0)
    end
    _G.Noclip = Value
    while _G.Noclip do wait()
    pcall(function()
    Noclip()
    end)
end
end)

Options.MyToggle:SetValue(false)

--Setting

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()

Tabs.Settings:AddParagraph({
    Title = "Misc",
    Content = "Enjoy!"
})

--rejoin

Tabs.Settings:AddButton({
    Title = "Rejoin Server",
    Description = "Rejoin",
    Callback = function()
        local ts = game:GetService("TeleportService")

        local p = game:GetService("Players").LocalPlayer
        
         
        
        ts:Teleport(game.PlaceId, p)
    end
})

--PlayerSpeed

local Slider = Tabs.Settings:AddSlider("Slider", {
    Title = "Player Speed",
    Description = "",
    Default = 16,
    Min = 16,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Slider:OnChanged(function(Value)
    
end)

Slider:SetValue(16)

--Jump Power

local Slider = Tabs.Settings:AddSlider("Slider", {
    Title = "Player JumpPower",
    Description = "",
    Default = 60,
    Min = 60,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Slider:OnChanged(function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

Slider:SetValue(60)

--Team

Tabs.Team:AddButton({
    Title = "Black",
    Description = "Black",
    Callback = function()
        Window:Dialog({
            Title = "Warning",
            Content = "Are You Sure?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-586.367065, -9.69999123, -80.7059784, -0.441471756, -4.50235085e-08, -0.89727515, -4.04081604e-08, 1, -3.02966683e-08, 0.89727515, 2.28821158e-08, -0.441471756)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Team:AddButton({
    Title = "Blue",
    Description = "Blue",
    Callback = function()
        Window:Dialog({
            Title = "Warning",
            Content = "Are You Sure?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(463.472961, -9.70000648, 249.021667, -0.881579995, -2.93551548e-08, -0.472034693, 1.34240992e-08, 1, -8.72596289e-08, 0.472034693, -8.32629823e-08, -0.881579995)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Team:AddButton({
    Title = "Green",
    Description = "Green",
    Callback = function()
        Window:Dialog({
            Title = "Warning",
            Content = "Are You Sure?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-588.69104, -9.69999123, 251.263138, -0.120647937, 6.20875937e-08, -0.992695332, 5.21933918e-09, 1, 6.19101215e-08, 0.992695332, 2.28811459e-09, -0.120647937)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Team:AddButton({
    Title = "Pink",
    Description = "Pink",
    Callback = function()
        Window:Dialog({
            Title = "Warning",
            Content = "Are You Sure?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(478.472778, -9.69999123, 658.649902, 0.95848316, 1.851752e-08, -0.285149187, -2.59490047e-08, 1, -2.22836434e-08, 0.285149187, 2.87578334e-08, 0.95848316)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Team:AddButton({
    Title = "Red",
    Description = "Red",
    Callback = function()
        Window:Dialog({
            Title = "Warning",
            Content = "Are You Sure?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(484.3924255371094, -9.699991226196289, -54.02690124511719)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Team:AddButton({
    Title = "White",
    Description = "White",
    Callback = function()
        Window:Dialog({
            Title = "Warning",
            Content = "Are You Sure?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56.871666, -9.69999123, -613.46759, -0.650971651, 7.14956316e-09, -0.759102046, -6.33533492e-09, 1, 1.4851345e-08, 0.759102046, 1.44769698e-08, -0.650971651)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

Tabs.Team:AddButton({
    Title = "Yellow",
    Description = "Yellow",
    Callback = function()
        Window:Dialog({
            Title = "Warning",
            Content = "Are You Sure?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-587.519165, -9.6998167, 682.534851, 0.0162683316, 1.44063153e-08, -0.999867678, 5.27892796e-09, 1, 1.44941126e-08, 0.999867678, -5.51402435e-09, 0.0162683316)
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})


--anti afk

local Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "AntiAfk", Default = false })

Toggle:OnChanged(function(Value)
    _G.antiAFK = Value

    while _G.antiAFK do wait()

    game:GetService'VirtualUser':Button1Down(Vector2.new(686, 352))
    
end
end)

Options.MyToggle:SetValue(false)


--ui Toggle

do
    local ToggleUI = game.CoreGui:FindFirstChild("toggle") 
    if ToggleUI then 
        ToggleUI:Destroy()
    end
end
local toggle = Instance.new("ScreenGui")
local Toggle1 = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")



toggle.Name = "toggle"
toggle.Parent = game.CoreGui
toggle.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Toggle1.Name = "Toggle1"
Toggle1.Parent = toggle
Toggle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle1.BorderSizePixel = 0
Toggle1.Position = UDim2.new(0.158999994, 0, -0.0560000017, 0)
Toggle1.Size = UDim2.new(0, 62, 0, 42)
Toggle1.Font = Enum.Font.SourceSans
Toggle1.Text = "Open/Close"
Toggle1.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle1.TextSize = 15.000

Toggle1.MouseButton1Click:Connect(function ()
game.CoreGui:FindFirstChild("ScreenGui").Enabled = not game.CoreGui:FindFirstChild("ScreenGui").Enabled
end)


UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Toggle1
