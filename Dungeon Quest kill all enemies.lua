-- press 'e' when in a dungeon to kill all enemies.
-- note: sometimes it will kill them, but it doesn't show it did. To fix this, walk up to them and they will despawn.

if not game.PlaceId == 2414851778 then
    game:GetService('Players').LocalPlayer:Kick('Wrong game')
end

if not game:IsLoaded() then
    game.Loaded:Wait() 
end

local player = game:GetService('Players').LocalPlayer
player.Character.Humanoid.WalkSpeed = 125
game:GetService("UserInputService").InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.E then
        for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA('Humanoid') and v ~= player.Character.Humanoid then
            	  v.Health = 0
            end
        end
    end
end)
