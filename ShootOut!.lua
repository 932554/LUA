if not game:IsLoaded() then
    game.Loaded:Wait()
end

if not game.PlaceId == 4738545896 then
    game:GetService('Players').LocalPlayer:Kick('Wrong game')
    return
end

local config = {
    toggles = {silentAim = false; point = false; espEnabled = false; espBoxes = false; espNames = false; espHealth = false; espLines = false;};
}

local Players = game:GetService('Players')
local Player = Players.LocalPlayer

local Heartbeat = game:GetService('RunService').Heartbeat

local Luminosity = loadstring(game:HttpGet("https://raw.githubusercontent.com/iHavoc101/Genesis-Studios/main/UserInterface/Luminosity.lua", true))()
local Window = Luminosity.new("Shoot Out!", "Version: 1.0.0")

local Tab1 = Window.Tab("Weapon")
local Folder1 = Tab1.Folder("Weapon Options", "Stuff that makes you good at the game")

Folder1.Switch("Silent aim", function(Status)
    if Status == true then
        config.toggles.silentAim = true
    else
        config.toggles.silentAim = false
    end
end)

local modWeap = game:GetService('ReplicatedFirst')['_0xS0URC3X'].Shared.WeaponDataManager
Folder1.Button("No recoil", "Click", function()
    for i,v in pairs(modWeap:GetChildren()) do
        if v:IsA('ModuleScript') then
            require(v).Settings.RECOIL_STRENGTH = 0.0
            require(v).Settings.AttackAnimation = nil
        end
    end
end)

Folder1.Button("No spread", "Click", function()
    for i,v in pairs(modWeap:GetChildren()) do
        if v:IsA('ModuleScript') then
            require(v).Settings.SPREAD = 0.0
        end
    end
end)

Folder1.Button("Infinite ammo", "Click", function()
    for i,v in pairs(modWeap:GetChildren()) do
        if v:IsA('ModuleScript') then
            require(v).Settings.MAX_AMMO = math.huge
        end
    end
end)

Folder1.Button("Instant reload", "Click", function()
    for i,v in pairs(modWeap:GetChildren()) do
        if v:IsA('ModuleScript') then
            require(v).Settings.RELOAD_TIME = 0
            require(v).Settings.ReloadAnimation = nil
        end
    end
end)

Folder1.Button("Automatic gun", "Click", function()
    for i,v in pairs(modWeap:GetChildren()) do
        if v:IsA('ModuleScript') then
            require(v).Settings.AUTOMATIC = true
        end
    end
end)

Folder1.Button("No heavy weapon slowdown", "Click", function()
    for i,v in pairs(modWeap:GetChildren()) do
        if v:IsA('ModuleScript') then
            require(v).Settings.HEAVY = false
        end
    end
end)

Folder1.Button("Rapid fire", "Click", function()
    for i,v in pairs(modWeap:GetChildren()) do
        if v:IsA('ModuleScript') then
            require(v).Settings.ROF = 999999
        end
    end
end)

local aimAssist = require(game:GetService('ReplicatedFirst')['_0xS0URC3X'].Shared.AimAssistSettings)
Heartbeat:Connect(function()
    if config.toggles.silentAim == true then
        aimAssist.MaxScreenCoverage = 999999
        aimAssist.MaxKDR = 99999999.99999999
        aimAssist.MaxRange = 999999999
    else
        aimAssist.MaxScreenCoverage = 0.15
        aimAssist.MaxKDR = 0.8
        aimAssist.MaxRange = 200
    end
    Heartbeat:Wait(1500)
end)

local gui = game:GetService('CoreGui'):FindFirstChild('Luminosity')
game:GetService('UserInputService').InputBegan:Connect(function()
    if game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.RightControl) then
        if gui.Enabled == false then
            gui.Enabled = true
        else
            gui.Enabled = false
        end
    end
end)
