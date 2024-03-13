--Cavehub build A Boat For Treasure

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Cave Hub 0.0.1",
    SubTitle = "by ! Chuck : chuck_007.",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Light",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
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
        Content = "This is a notification",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })
end

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
                wait(50)
                workspace:WaitForChild("ClaimRiverResultsGold"):FireServer()
                end
    end
end)

Options.MyToggle:SetValue(false)

--FastFarm

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "FastFarm", Default = false })

Toggle:OnChanged(function()
    _G.FastFarm = Value
    if _G.FastFarm then
    while _G.FastFarm do
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-52.2302132, 76.744873, 1370.04663, -0.007667806, 0.0216241106, -0.999736786, -3.09888677e-11, 0.999766171, 0.0216247458, 0.999970615, 0.000165814388, -0.00766601274)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-68.6247559, 66.6218491, 1798.02148, 0.0354622565, 0.0811866149, -0.996067822, -9.34302524e-10, 0.996694744, 0.081237711, 0.999370992, -0.00288087153, 0.035345044)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-74.3358459, 50.9703064, 2134.14819, -0.00941210426, 0.100352615, -0.994907439, -1.93980082e-10, 0.994951487, 0.100357063, 0.999955714, 0.000944571337, -0.00936458725)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.0092163, 65.9925919, 2521.22925, -0.0510784984, 0.0543541573, -0.997214437, -2.12433432e-10, 0.998517871, 0.0544252023, 0.998694658, 0.00277995784, -0.051002793)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-47.8642845, 46.6997948, 2911.09961, -0.0261652041, 0.00837200228, -0.999622583, -3.58407748e-11, 0.999964952, 0.00837486982, 0.999657631, 0.000219130205, -0.0261642858)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-57.469841, 62.9240608, 3377.90942, -0.0010673753, 0.0314113572, -0.999505997, -1.84598569e-11, 0.999506533, 0.0314113759, 0.999999404, 3.35277473e-05, -0.00106684864)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51.7502861, 48.701149, 3684.29834, -0.0509141013, 0.0773153231, -0.995705843, -7.07872483e-10, 0.996998906, 0.0774157271, 0.998703063, 0.00394155318, -0.0507613048)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-53.3029709, 69.8554459, 4134.87012, -0.0459459908, -0.0299719907, -0.998494208, -1.52237598e-10, 0.999549806, -0.0300036762, 0.998943925, -0.00137854845, -0.0459253043)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-71.3541489, 99.4533539, 4454.18164, -0.0138620464, -0.0237352476, 0.999622166, 8.70055764e-11, 0.999718249, 0.0237375293, -0.999903917, 0.000329050818, -0.0138581404)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-50.3252563, 105.060272, 4891.77783, -0.999456823, -0.000908307906, 0.0329433233, -4.0865155e-11, 0.99962014, 0.027561361, -0.032955844, 0.027546389, -0.999077141)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-14.9411955, 57.7307091, 5223.51758, 0.042988047, 0.0184888951, 0.998904467, -2.66561689e-10, 0.999828756, -0.0185060017, -0.999075592, 0.000795536616, 0.0429806858)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-46.8686676, 63.5758018, 5773.81934, -0.99764359, -0.00505315745, 0.0684235767, -3.85047771e-10, 0.997284114, 0.0736505389, -0.0686099082, 0.0734769851, -0.994934082)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-29.3110218, 9.99339867, 5990.85596, -0.0537727736, 0.0391126424, -0.99778688, 2.51981963e-10, 0.99923259, 0.0391693115, 0.998553216, 0.00210624235, -0.0537315086)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-94.1563263, 40.0557861, 6421.80615, 0.0209013242, -0.0874333382, -0.995951056, 4.67443806e-10, 0.996168673, -0.0874524415, 0.999781549, 0.00182787143, 0.0208212454)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-82.4079666, 15.3482761, 6758.19873, 0.0408331007, -0.0606071502, -0.997326136, -1.04379907e-10, 0.998158634, -0.0606577396, 0.999165952, 0.00247684377, 0.0407579131)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-61.293129, 58.9983177, 7171.13037, -0.00899348874, -0.0874455422, -0.996128678, -1.48095744e-10, 0.996168971, -0.0874490812, 0.999959528, -0.000786472112, -0.00895903446)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-64.0970612, 46.1037903, 7530.12256, 0.0209178776, 0.0237900764, -0.999498129, 1.15691644e-10, 0.999716878, 0.0237952825, 0.999781191, -0.000497746922, 0.0209119543)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-57.6790428, 72.7092285, 7964.08252, -0.994414449, 0.00575264357, -0.105388604, -3.01964634e-11, 0.998513579, 0.0545039251, 0.105545491, 0.0541994907, -0.992936313)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-83.5459976, 64.272171, 8297.63672, -0.0539625585, 0.0659064725, -0.996365607, -1.56360236e-09, 0.997819424, 0.0660026446, 0.998542964, 0.00356167322, -0.0538448915)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-53.3496475, 52.0342445, 8816.93359, -0.999875128, -0.000292086275, -0.0157994293, -7.71015803e-12, 0.999829173, -0.0184839815, 0.0158021301, -0.0184816718, -0.999704301)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-43.13937, -293.722778, 8886.16895, -0.999991715, -0.000602571294, 0.00402874686, 1.86976008e-11, 0.98899895, 0.147922516, -0.00407356024, 0.147921294, -0.988990724)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-51.764164, -340.82782, 9344.74219, -0.999819279, -0.00331548462, 0.0187193751, 4.33286212e-10, 0.984674752, 0.174400821, -0.0190107189, 0.174369305, -0.984496772)
    wait(.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-55.9961357, -359.302094, 9496.53906, -0.987181485, 2.83003381e-08, 0.159601718, 1.56369797e-08, 1, -8.0599392e-08, -0.159601718, -7.70705384e-08, -0.987181485)
    wait(17)
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


--ui Toggle

do
    local ToggleUI = game.CoreGui:FindFirstChild("toggle") 
    if ToggleUI then 
        toggle:Destroy()
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
