-- press 'f' when in a dungeon to kill all enemies. You will have to walk through the dungeon and press 'f' multiple times.
-- note: sometimes it will kill them, but it doesn't show it did. To fix this, walk up to them and they will despawn.
-- After a bit of testing, it seems to only work in the first dungeon (sand). Will update eventually to work in all of them.

if not game.PlaceId == 2414851778 then
    game:GetService('Players').LocalPlayer:Kick('Wrong game')
end

if not game:IsLoaded() then
    game.Loaded:Wait() 
end

local player = game:GetService('Players').LocalPlayer
game:GetService("UserInputService").InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.F then
        for i,v in pairs(workspace:GetDescendants()) do
            if v:IsA('Humanoid') and v ~= player.Character.Humanoid then
            	v.Health = 0
            end
        end
    end
end)