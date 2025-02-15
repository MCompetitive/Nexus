-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the UI Window
local Window = Rayfield:CreateWindow({
    Name = "Paste Hub",
    LoadingTitle = "Loading Paste Hub",
    LoadingSubtitle = "By Dickhead Team",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- Set a folder name if needed
        FileName = "Dick Hub"
    },
    Discord = {
        Enabled = false,
        Invite = "", -- Discord invite code (if needed)
        RememberJoins = true
    },
    KeySystem = false -- Set to true if using a key system
})

-- Create Tabs
local VehicleTab = Window:CreateTab("Vehicle", 8356815386) -- Icon ID
local TeleportTab = Window:CreateTab("Teleport", 8360954483) -- Icon ID
local InfoTab = Window:CreateTab("Information", 8356778308) -- Icon ID

-- Gravity Toggle
local VehicleSection = VehicleTab:CreateSection("Gravity Innit")
local gravityEnabled = true -- Default state
VehicleTab:CreateToggle({
    Name = "Gravity Toggle",
    CurrentValue = gravityEnabled,
    Callback = function(Value)
        gravityEnabled = Value
        if gravityEnabled then
            game.Workspace.Gravity = 200 -- Adjusted gravity to make cars drift
        else
            game.Workspace.Gravity = 50 -- No gravity
        end
    end
})

--Autofarm
local FarmingTab = Window:CreateTab("Farming", 8356778308)

FarmingTab:CreateButton({
    Name = "Sahara AutoFarm",
    Callback = function()
        while true do
            wait(1)
            rs.Remote.CollectSaharaResources:FireServer()
        end
    end
})

--Refuel
local VehicleSection = VehicleTab:CreateSection("Fuel Tank")

local rs = game:GetService("ReplicatedStorage")

VehicleTab:CreateButton({
    Name = "Refuel",
    Callback = function()
        rs.Remote.Refuel:FireServer(1, os.time())
    end
})

-- Add Teleporter Section
local TeleportSection = TeleportTab:CreateSection("Teleporter")

-- Add a Teleport Button (Example Location)
TeleportTab:CreateButton({
    Name = "Roadmap",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character then
            player.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(-1584.9815673828125, -71.16507720947266, -11396.05078125))) -- Example Coordinates
        end
    end
})
TeleportTab:CreateButton({
    Name = "Ron Rivers",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character then
            player.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(-3526.211669921875, -100.32514190673828, -1834.55859375))) -- Example Coordinates
        end
    end
})
TeleportTab:CreateButton({
    Name = "Airport",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character then
            player.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(6152.7333984375, -70.10242462158203, -10634.7890625))) -- Example Coordinates
        end
    end
})
TeleportTab:CreateButton({
    Name = "Horton",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character then
            player.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(-1566.75146484375, -97.36862182617188, 4074.514892578125))) -- Example Coordinates
        end
    end
})

-- Add Discord Invite Button in Information Section
InfoTab:CreateButton({
    Name = "Join Our Discord",
    Callback = function()
        setclipboard("https://discord.gg/CFmMkx4kE8") -- Replace with actual invite link
        Rayfield:Notify({
            Title = "Discord Invite",
            Content = "Discord invite link copied to clipboard!",
            Duration = 5,
            Type = "Success"
        })
    end
})

-- Show the UI
Rayfield:LoadConfiguration()
