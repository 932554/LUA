if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

if Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
    warn("Animations will not work. Rejoin in R15.")
	return
end

Player.CharacterAdded:Connect(function(Char)
    Character = Char
end)

local AnimationIds = {
    idle1 = 707742142,
    idle2 = 707855907,
    run = 707861613,
    walk = 754636298,
    jump = 754637084,
    fall = 754636589,
    swim = 754638471,
    swimIdle = 707742142,
    climb = 754639239
}

local function AnimatePlayer(Character)
    local Humanoid = Character:WaitForChild("Humanoid")
    local Animate = Character:WaitForChild("Animate")

    if Humanoid.RigType == Enum.HumanoidRigType.R15 then
        Animate.idle.Animation1.AnimationId = "rbxassetid://" .. AnimationIds.idle1
        Animate.idle.Animation2.AnimationId = "rbxassetid://" .. AnimationIds.idle2
        Animate.run.RunAnim.AnimationId = "rbxassetid://" .. AnimationIds.run
        Animate.walk.WalkAnim.AnimationId = "rbxassetid://" .. AnimationIds.walk
        Animate.jump.JumpAnim.AnimationId = "rbxassetid://" .. AnimationIds.jump
        Animate.fall.FallAnim.AnimationId = "rbxassetid://" .. AnimationIds.fall
        Animate.swim.Swim.AnimationId = "rbxassetid://" .. AnimationIds.swim
        Animate.swimidle.SwimIdle.AnimationId = "rbxassetid://" .. AnimationIds.swimIdle
        Animate.climb.ClimbAnim.AnimationId = "rbxassetid://" .. AnimationIds.climb
    end
end

if Character then
    AnimatePlayer(Character)
end

Player.CharacterAdded:Connect(AnimatePlayer)
