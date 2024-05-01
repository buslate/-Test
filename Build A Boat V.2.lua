--เรือโครตโหด
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Cave Hub",
    SubTitle = "1.0.1 | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    TabWidth = 160,
    Size = UDim2.fromOffset(250, 450),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" }),
    Misc = Window:AddTab({ Title = "Mics", Icon = "rbxassetid://12966835146" }),
    Shop = Window:AddTab({ Title = "Shop", Icon = "rbxassetid://11419715399" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Download CaveHub",
        SubContent = "", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })
end
wait(.5)
do
    Fluent:Notify({
        Title = "Notification",
        Content = "Completed",
        SubContent = "", -- Optional
        Duration = 6 -- Set to nil to make the notification not disappear
    })
end

--------------------------------------------[[Tween]]--------------------------------------------

function Tween1(P)
    Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance <= 500 then
        speed = 800
    else
        speed = 390
    end
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/speed, Enum.EasingStyle.Linear),{CFrame = P}):Play()
end

function Tween2(P)
    Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    speed = 3500
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/speed, Enum.EasingStyle.Linear),{CFrame = P}):Play()
end 

--------------------------------------------------[[AutoFarm]]--------------------------------------------------

local section = Tabs.Main:AddSection("AutoFarm")

--[[AutoFarmMoney]]--

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "AutoFarmMoney", Default = false })

Toggle:OnChanged(function(Value)
_G.FarmMoney = Value
    if _G.FarmMoney then
        while _G.FarmMoney do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-59.1480827, 65.9903183, 825.942993, -0.999984741, 0.000596735394, -0.00549316173, 4.81166842e-11, 0.994151235, 0.107997037, 0.00552547909, 0.107995383, -0.994136035)
        wait(.1)
        Tween1(CFrame.new(-48.3229675, 34.0048294, 8803.8125, -0.999902487, 0.00068842771, 0.0139483986, -1.12289102e-10, 0.998784244, -0.0492953248, -0.0139653767, -0.0492905192, -0.99868685))
        wait(21)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
        wait(10)
        end
    end
end)

Options.MyToggle:SetValue(false)

--[[AutoFarmMoney,GoldBox]]--

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "AutoFarmMoney,GoldBox", Default = false })

Toggle:OnChanged(function(Value)
_G.AutoFarmGoldBoxMoney = Value
    if _G.AutoFarmGoldBoxMoney then
        while _G.AutoFarmGoldBoxMoney do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-59.1480827, 65.9903183, 825.942993, -0.999984741, 0.000596735394, -0.00549316173, 4.81166842e-11, 0.994151235, 0.107997037, 0.00552547909, 0.107995383, -0.994136035)
        wait(.1)
        Tween1(CFrame.new(-48.3229675, 34.0048294, 8803.8125, -0.999902487, 0.00068842771, 0.0139483986, -1.12289102e-10, 0.998784244, -0.0492953248, -0.0139653767, -0.0492905192, -0.99868685))
        wait(21)
        Tween1(CFrame.new(-55.5586624, -359.302094, 9495.74512, -0.931606233, 5.3427005e-09, -0.363469124, 2.83643757e-08, 1, -5.80014294e-08, 0.363469124, -6.43440643e-08, -0.931606233))
        wait(3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-55.5586624, -359.302094, 9495.74512, -0.931606233, 5.3427005e-09, -0.363469124, 2.83643757e-08, 1, -5.80014294e-08, 0.363469124, -6.43440643e-08, -0.931606233)
        wait(20)
        end
    end
end)

--[[AutoFarmGoldBox]]--

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "AutoFarmGoldBox", Default = false })

Toggle:OnChanged(function(Value)
_G.AutoFarmGoldBox = Value
    if _G.AutoFarmGoldBox then
        while _G.AutoFarmGoldBox do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-59.1480827, 65.9903183, 825.942993, -0.999984741, 0.000596735394, -0.00549316173, 4.81166842e-11, 0.994151235, 0.107997037, 0.00552547909, 0.107995383, -0.994136035)
        Tween2(CFrame.new(-48.3229675, 34.0048294, 8803.8125, -0.999902487, 0.00068842771, 0.0139483986, -1.12289102e-10, 0.998784244, -0.0492953248, -0.0139653767, -0.0492905192, -0.99868685))
        wait(2.3)
        Tween2(CFrame.new(-55.5586624, -359.302094, 9495.74512, -0.931606233, 5.3427005e-09, -0.363469124, 2.83643757e-08, 1, -5.80014294e-08, 0.363469124, -6.43440643e-08, -0.931606233))
        wait(20)
        end
    end
end)

Options.MyToggle:SetValue(false)

--[[ResetCharacter]]--
Tabs.Main:AddButton({
    Title = "ResetCharacter",
    Description = "",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

--[[FUN]]--

local section = Tabs.Main:AddSection("Fun")
local Input = Tabs.Main:AddInput("Input", {
    Title = "SpeedSpin",
    Placeholder = "Number",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)
        degrees = Value
    end
})


local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Spin", Default = false })

Toggle:OnChanged(function(Value)
_G.SpinMode = Value
if _G.SpinMode then
local player = game.Players.LocalPlayer
local function SpinPlayer()
    while _G.SpinMode do
        player.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(degrees), 0)
        task.wait()
    end
end

SpinPlayer()
    end
end)

Options.MyToggle:SetValue(false)

-------------------------------------------------[[Misc]]--------------------------------------------

local section = Tabs.Misc:AddSection("Quest")
Tabs.Misc:AddParagraph({
    Title = "Request Target Quest",
    Content = "You in Blue Team Only"
})

local Toggle = Tabs.Misc:AddToggle("MyToggle", {Title = "Target Quest", Default = false })

Toggle:OnChanged(function(Value)
_G.TargetQuest = Value
    if _G.TargetQuest then
        local args = {
            [1] = 2
        }
        
        workspace:WaitForChild("QuestMakerEvent"):FireServer(unpack(args))
        wait(.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105, 141, 289)
    end
end)
Options.MyToggle:SetValue(false)
local section = Tabs.Misc:AddSection("TeleportTeam")

local Dropdown = Tabs.Misc:AddDropdown("Dropdown", {
    Title = "SelectTeam",
    Values = {"Black", "Blue", "Green", "Pink", "Red", "White", "Yellow"},
    Multi = false,
    Default = 1,
})

Dropdown:SetValue("four")

Dropdown:OnChanged(function(Value)
    color = Value
end)


Tabs.Misc:AddButton({
    Title = "Click To TP",
    Description = "",
    Callback = function()
    TeleportToColor(Dropdown.Value)
    end
})


-------------------------------------------------[[Shop]]--------------------------------------------

local section = Tabs.Shop:AddSection("Accessories Tool")

Tabs.Shop:AddButton({
    Title = "Painting Tool",
    Description = "Money : 1,500",
    Callback = function()
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Painting Tool",1)
    end
})
Tabs.Shop:AddButton({
    Title = "Binding Tool",
    Description = "Money : 2,000",
    Callback = function()
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Binding Tool",1)
    end
})
Tabs.Shop:AddButton({
    Title = "Property Tool",
    Description = "Money : 2,500",
    Callback = function()
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Property Tool",1)
    end
})
Tabs.Shop:AddButton({
    Title = "Scaling Tool",
    Description = "Money : 5,000",
    Callback = function()
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Scaling Tool",1)
    end
})
Tabs.Shop:AddButton({
    Title = "Trowel Tool",
    Description = "Money : 7,500",
    Callback = function()
        workspace:WaitForChild("ItemBoughtFromShop"):InvokeServer("Trowel Tool",1)
    end
})

--------------------------------------------[[Noclip]]--------------------------------------------

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.FarmMoney or _G.AutoFarmGoldBoxMoney or _G.AutoFarmGoldBox then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(1000000,1000000,1000000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                    Noclip.CanCollide = false
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
               end
          end)
     end
end)

-------------------------------------------------[[TeleportTeam]]--------------------------------------------

function TeleportToColor(color)
    if color == "Black" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-585.89892578125, -9.701964378356934, -58.53709030151367)
    elseif color == "Blue" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(478.3410339355469, -9.7019624710083, 289.38494873046875)
    elseif color == "Green" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-585.833251953125, -9.701966285705566, 303.4530944824219)
    elseif color == "Pink" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(478.5516052246094, -9.701963424682617, 636.7717895507812)
    elseif color == "Red" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(478.5126037597656, -9.701966285705566, -75.66240692138672)
    elseif color == "White" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-60.072845458984375, -9.701964378356934, -602.3859252929688)
    elseif color == "Yellow" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-585.8826293945312, -9.701966285705566, 651.19970703125)
    end
end



-------------------------------------------------[[Setting]]--------------------------------------------
Tabs.Settings:AddButton({
    Title = "Rejoin",
    Description = "",
    Callback = function()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
    end
})

Tabs.Settings:AddButton({
    Title = "Hop To Low Server",
    Description = "",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        local _place = game.PlaceId
        local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
        function ListServers(cursor)
            local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
            return Http:JSONDecode(Raw)
        end
        local Server, Next; repeat
               local Servers = ListServers(Next)
               Server = Servers.data[1]
               Next = Servers.nextPageCursor
        until Server
        TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
     end
})




Tabs.Settings:AddButton(
    {
        Title = "FpsBoots",
        Description = "",
        Callback = function()
            local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
            local g = game
            local w = g.Workspace
            local l = g.Lighting
            local t = w.Terrain
            sethiddenproperty(l, "Technology", 2)
            sethiddenproperty(t, "Decoration", false)
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
                elseif v:IsA("SpecialMesh") and decalsyeeted then
                    v.TextureId = 0
                elseif v:IsA("ShirtGraphic") and decalsyeeted then
                    v.Graphic = 0
                elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
                    v[v.ClassName .. "Template"] = 0
                end
            end
            for i = 1, #l:GetChildren() do
                e = l:GetChildren()[i]
                if
                    e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or
                        e:IsA("BloomEffect") or
                        e:IsA("DepthOfFieldEffect")
                 then
                    e.Enabled = false
                end
            end
            w.DescendantAdded:Connect(
                function(v)
                    wait()
                     --prevent errors and shit
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
                        v.TextureId = 0
                    elseif v:IsA("ShirtGraphic") and decalsyeeted then
                        v.ShirtGraphic = 0
                    elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
                        v[v.ClassName .. "Template"] = 0
                    end
                end
            )
        end
    }
)

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

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
local Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "AntiAfk", Default = false })

Toggle:OnChanged(function(Value)
    _G.antiAFK = Value
    while _G.antiAFK do wait(30)
    game:GetService'VirtualUser':Button1Down(Vector2.new(788, 547))
end
end)

-------------------------------------------------[[Toggle UI]]--------------------------------------------

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
ImageButton.Image = "rbxassetid://17156242075"
ImageButton.MouseButton1Click:Connect(function()
game.CoreGui:FindFirstChild("ScreenGui").Enabled = not game.CoreGui:FindFirstChild("ScreenGui").Enabled
end)


UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ImageButton

Window:SelectTab(1)
