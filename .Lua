--Cavehub build A Boat For Treasure

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Cave Hub 0.0.6",
    SubTitle = "by ! Chuck : chuck_007.",
    TabWidth = 160,
    Size = UDim2.fromOffset(510, 390),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.Home -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://11433532654" }),
    Team = Window:AddTab({ Title = "Change Team", Icon = "rbxassetid://12966835146" }),
    Shop = Window:AddTab({ Title = "Shop(Coming Soon..)", Icon = "rbxassetid://11419702273" }),
    Build = Window:AddTab({ Title = "AutoBuild(Coming Soon..)", Icon = "rbxassetid://12967712847" }),
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
                    Vector3.new(-49.6203003, 52.1805964, 668.363831, -0.999993563, -0.0002226332, 0.00357921072, 7.38511075e-12, 0.998071074, 0.0620817766, -0.00358612812, 0.062081378, -0.998064637),
                    Vector3.new(-49.0358887, 44.6002235, 1283.07361, -0.999757111, -0.00103060459, 0.0220147371, 5.74352198e-11, 0.998906016, 0.0467630923, -0.0220388472, 0.0467517339, -0.998663366),
                    Vector3.new(-52.2924042, 52.8626137, 8810.67676, -0.999800801, -0.00402260385, -0.0195484515, -1.07728368e-10, 0.979477584, -0.201553062, 0.0199580379, -0.201512918, -0.979282498),
                    Vector3.new(-55.7633247, -359.302094, 9496.33789, 0.0546190403, 6.63240058e-08, 0.998507261, 7.08811356e-08, 1, -7.03004019e-08, -0.998507261, 7.46150661e-08, 0.0546190403)
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
    _G.FarmGold = Value
    if _G.FarmGold then
    while _G.FarmGold do

        local targetPositions = {
                    Vector3.new(-49.6203003, 52.1805964, 668.363831, -0.999993563, -0.0002226332, 0.00357921072, 7.38511075e-12, 0.998071074, 0.0620817766, -0.00358612812, 0.062081378, -0.998064637),
                    Vector3.new(-49.0358887, 44.6002235, 1283.07361, -0.999757111, -0.00103060459, 0.0220147371, 5.74352198e-11, 0.998906016, 0.0467630923, -0.0220388472, 0.0467517339, -0.998663366),
                    Vector3.new(-52.2924042, 52.8626137, 8810.67676, -0.999800801, -0.00402260385, -0.0195484515, -1.07728368e-10, 0.979477584, -0.201553062, 0.0199580379, -0.201512918, -0.979282498),
                    Vector3.new(-55.7633247, -359.302094, 9496.33789, 0.0546190403, 6.63240058e-08, 0.998507261, 7.08811356e-08, 1, -7.03004019e-08, -0.998507261, 7.46150661e-08, 0.0546190403)
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
                    local speed = 2000 -- Adjust speed as desired
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

Tabs.Main:AddButton({
    Title = "Reset Character(if Bug)",
    Description = "Reset Character",
    Callback = function()
        local function forceResetAction(player)
            -- Check if player and Humanoid exist
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
              player.Character.Humanoid.Health = 0
            end
          end
          
          -- Example usage (call this function from another script)
          -- Replace "game.Players.LocalPlayer" with the target player object if needed
          forceResetAction(game.Players.LocalPlayer)
    end
})

--Shop


--AutoBuild

Tabs.Build:AddParagraph({
    Title = "Beta",
    Content = "Request : GoldBox 300"
})

--Setting

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

--FPS boot

Tabs.Settings:AddButton({
    Title = "FpsBoots🚀",
    Description = "🚀",
    Callback = function()

local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
sethiddenproperty(l,"Technology",2)
sethiddenproperty(t,"Decoration",false)
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = 0
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(w:GetDescendants()) do
    if v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") and decalsyeeted then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    elseif v:IsA("SpecialMesh") and decalsyeeted  then
        v.TextureId=0
    elseif v:IsA("ShirtGraphic") and decalsyeeted then
        v.Graphic=0
    elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
        v[v.ClassName.."Template"]=0
    end
end
for i = 1,#l:GetChildren() do
    e=l:GetChildren()[i]
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
w.DescendantAdded:Connect(function(v)
    wait()--prevent errors and shit
   if v:IsA("BasePart") and not v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
    elseif v:IsA("MeshPart") and decalsyeeted then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    elseif v:IsA("SpecialMesh") and decalsyeeted then
        v.TextureId=0
    elseif v:IsA("ShirtGraphic") and decalsyeeted then
        v.ShirtGraphic=0
    elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
        v[v.ClassName.."Template"]=0
    end
end)
    end
})


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


--PlayerSpeed

local Slider = Tabs.Settings:AddSlider("Slider", {
    Title = "Seed",
    Description = "",
    Default = 16,
    Min = 0,
    Max = 500,
    Rounding = 0,
    Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Slider:OnChanged(function(Value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
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
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
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

--uitoggle

do
    local ToggleUI = game.CoreGui:FindFirstChild("MyToggle") 
    if ToggleUI then 
    ToggleUI:Destroy() 
    end
end

local MyToggle = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

--Properties:

MyToggle.Name = "MyToggle"
MyToggle.Parent = game.CoreGui
MyToggle.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = MyToggle
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.156000003, 0, -0, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Image = "rbxassetid://16731758728"
ImageButton.MouseButton1Click:Connect(function()
game.CoreGui:FindFirstChild("ScreenGui").Enabled = not game.CoreGui:FindFirstChild("ScreenGui").Enabled
end)


UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ImageButton
