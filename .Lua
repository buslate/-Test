local ArrayField = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AArrayfield%20Library"))()
--Documentation url: https://docs.sirius.menu/community/arrayfield

local Window = ArrayField:CreateWindow({
        Name = "Test(เรือ)",
        LoadingTitle = "Wait4Sec",
        LoadingSubtitle = "by กูเอง",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil, -- Create a custom folder for your hub/game
            FileName = "ArrayField"
        },
        KeySystem = true, -- Set this to true to use our key system
        KeySettings = {
            Title = "Test(เรือ)",
            Subtitle = "Key System",
            Note = "it Beta Test Not Relese yet Key is 1234",
            FileName = "ArrayFieldsKeys",
            SaveKey = false,
            GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
            Key = {"1234"},
            Actions = {
                [1] = {
                    Text = 'Click here to copy the key link',
                    OnPress = function()
                    setclipboard('https://www.youtube.com/watch?v=0m-OAn4LfQU&ab_channel=PleIrin')
                    end,
                }
            },
        }
    })

    --tab1
    local Tab = Window:CreateTab("Main", 13170451197) -- Title, Image
    local Toggle = Tab:CreateToggle({
        Name = "Auto Farm(if bug reset Character)",
        Info = {
            Title = '',
            Image = '12735851647',
            Description = '',
        },
        CurrentValue = false,
        Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(F)
_G.Farm = F
            local targetPositions = {
                Vector3.new(-48.1998291, 302.233459, 468.659515),
                Vector3.new(-73.4712296, 47.8088417, 1378.35571),
                Vector3.new(-60.0339928, 44.2110901, 8675.1875),
                Vector3.new(-33.9269104, -298.752319, 9098.10938),
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
                local speed = 260 -- Adjust speed as desired
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
                            wait(5) -- Wait for death animation to finish
                            currentTargetIndex = 1 -- Reset index to teleport back to the first position
                            teleportToNextTarget() -- Restart the loop
                        end)
                    end)
                end
            teleportToNextTarget() -- Start the loop
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
            Noclip.Size = Vector3.new(60, 1, 60)
        function Noclip()
            game:GetService("Workspace"):FindFirstChild("Noclip").CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-4,0)
        end
        _G.Noclip = F
        while _G.Noclip do wait()
        pcall(function()
        Noclip()
        end)
    end
end})
local Label = Tab:CreateLabel("Change Team",Section)
local Button = Tab:CreateButton({
    Name = "Black",
    Info = {
        Title = 'This is a Button',
        Description = 'This is a description for the button you know.',
    },
    Interact = '',
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-586.367065, -9.69999123, -80.7059784, -0.441471756, -4.50235085e-08, -0.89727515, -4.04081604e-08, 1, -3.02966683e-08, 0.89727515, 2.28821158e-08, -0.441471756)
    end,
})
local Button = Tab:CreateButton({
    Name = "Blue",
    Info = {
        Title = 'This is a Button',
        Description = 'This is a description for the button you know.',
    },
    Interact = '',
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(463.472961, -9.70000648, 249.021667, -0.881579995, -2.93551548e-08, -0.472034693, 1.34240992e-08, 1, -8.72596289e-08, 0.472034693, -8.32629823e-08, -0.881579995)
    end,
})
local Button = Tab:CreateButton({
    Name = "Green",
    Info = {
        Title = 'This is a Button',
        Description = 'This is a description for the button you know.',
    },
    Interact = '',
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-588.69104, -9.69999123, 251.263138, -0.120647937, 6.20875937e-08, -0.992695332, 5.21933918e-09, 1, 6.19101215e-08, 0.992695332, 2.28811459e-09, -0.120647937)
    end,
})
local Button = Tab:CreateButton({
    Name = "Pink",
    Info = {
        Title = 'This is a Button',
        Description = 'This is a description for the button you know.',
    },
    Interact = '',
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(478.472778, -9.69999123, 658.649902, 0.95848316, 1.851752e-08, -0.285149187, -2.59490047e-08, 1, -2.22836434e-08, 0.285149187, 2.87578334e-08, 0.95848316)
    end,
})
local Button = Tab:CreateButton({
    Name = "Red",
    Info = {
        Title = 'This is a Button',
        Description = 'This is a description for the button you know.',
    },
    Interact = '',
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(484.3924255371094, -9.699991226196289, -54.02690124511719)
    end,
})
local Button = Tab:CreateButton({
    Name = "White",
    Info = {
        Title = 'This is a Button',
        Description = 'This is a description for the button you know.',
    },
    Interact = '',
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-56.871666, -9.69999123, -613.46759, -0.650971651, 7.14956316e-09, -0.759102046, -6.33533492e-09, 1, 1.4851345e-08, 0.759102046, 1.44769698e-08, -0.650971651)
    end,
})
local Button = Tab:CreateButton({
    Name = "Yellow",
    Info = {
        Title = 'This is a Button',
        Description = 'This is a description for the button you know.',
    },
    Interact = '',
    Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-587.519165, -9.6998167, 682.534851, 0.0162683316, 1.44063153e-08, -0.999867678, 5.27892796e-09, 1, 1.44941126e-08, 0.999867678, -5.51402435e-09, 0.0162683316)
    end,
})







--Tab2 mics
local Tab = Window:CreateTab("Misc", 13192363768) -- Title, Image
local Button = Tab:CreateButton({
    Name = "Rejoin",
    Info = {
        Title = '',
        Description = '',
    },
    Interact = '',
    Callback = function()
        local ts = game:GetService("TeleportService")

        local p = game:GetService("Players").LocalPlayer
        
         
        
        ts:Teleport(game.PlaceId, p)
    end,
})
local Button = Tab:CreateButton({
    Name = "Hop Server",
    Info = {
        Title = '',
        Description = '',
    },
    Interact = '',
    Callback = function()
        local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()

        module:Teleport(game.PlaceId)
    end,
})
local Slider = Tab:CreateSlider({
    Name = "Player Speed",
    Range = {0, 300},
    Increment = 5,
    Suffix = "",
    CurrentValue = 25,
    Flag = "Slider1",
    Callback = function(S)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = S
    end,
})
local Slider = Tab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 300},
    Increment = 5,
    Suffix = "",
    CurrentValue = 25,
    Flag = "Slider1",
    Callback = function(J)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = J
end
})
local Button = Tab:CreateButton({
    Name = "Admin",
    Info = {
        Title = '',
        Description = '',
    },
    Interact = '',
    Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
    end,
})
