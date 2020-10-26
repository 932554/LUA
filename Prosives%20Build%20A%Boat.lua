local Library = loadstring(game:HttpGet("https://pastebin.com/raw/edJT9EGX", true))()
local Window = Library:CreateWindow "Build a Boat"
local folder1 = Window:AddFolder "Main"
folder1:AddToggle(
    {
        text = "Auto Farm",
        flag = "toggle",
        state = false,
        callback = function(a)
            AutoFarm = a
            if AutoFarm == true then
                wait(0.1)
                function Upd()
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v.Name == "DarknessPart" or v.Name == "GatePart" then
                            v.Size = Vector3.new(257.4, 155.8, 100)
                        end
                    end
                end
                Upd()
                local Chest = game.workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Collider
                Chest.Size = Vector3.new(948.8, 1327.2, 1401.6)
                Chest.CFrame = CFrame.new(-54.5, -218.1, 9316.9)
                Chest.CanCollide = true
                while true do
                    wait(0.1)
                    if AutoFarm == true then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(42.897, 35, 463.6)
                        local Force = Instance.new("BodyVelocity")
                        Force.Name = ""
                        Force.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                        Force.MaxForce = Vector3.new(99999, 99999, 99999)
                        Force.Velocity = Vector3.new(0, 0, 625)
                        wait(18)
                        Upd()
                    end
                end
            else
                wait(0.1)
                print("false")
            end
        end
    }
)
Library:Init()
