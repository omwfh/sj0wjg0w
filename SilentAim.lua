local a = loadstring(game:HttpGet("https://raw.githubusercontent.com/omwfh/sj0wjg0w/main/AimingModule.lua"))()
a.TeamCheck(false)

local b = game:GetService("Workspace")
local c = game:GetService("Players")
local d = game:GetService("RunService")
local e = game:GetService("UserInputService")
local f = c.LocalPlayer
local g = f:GetMouse()
local h = b.CurrentCamera
local i = {SilentAim = true, AimLock = true, Prediction = 0.165}

getgenv().DaHoodSettings = i

function a.Check() if not (a.Enabled == true and a.Selected ~= f and a.SelectedPart ~= nil) then
		return false 
	end

	local j = a.Character(a.Selected)
	local k = j:WaitForChild("BodyEffects")["K.O"].Value
	local l = j:FindFirstChild("GRABBING_CONSTRAINT") ~= nil

	if k or l then return false end
	return true 
end

local m

m = hookmetamethod(game, "__index", function(n,o) if n:IsA("Mouse") and (o == "Hit"or o == "Target") and a.Check() then
		local p = a.SelectedPart
		if i.SilentAim and(o == "Hit" or o == "Target") then
			local q = p.CFrame + p.Velocity * i.Prediction
			return o == "Hit" and q or p 
		end 
	end
	return m(n,o)
end)

--if _G.Kimbladi == true then
--	pcall(function()
--		local UIS = game:GetService("UserInputService")
--		local RunService = game:GetService("RunService")
--		local Client = game:GetService("Players").LocalPlayer
--		local Character = Client.Character or Client.CharacterAdded:Wait()
--		local Humanoid = Character:FindFirstChild("Humanoid")
--		local Animate = Character.Animate
		
--		RunService.Stepped:Connect(function()
--			if UIS:IsKeyDown(Enum.KeyCode.KeypadFive) then
--				pcall(function()
					
--					wait(0.2)
					
--					Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
--					Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782841498"
--					Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
--					Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
--					Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
--					Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
--					Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"

--					Humanoid.Jump = false

--				end)
--			end
--		end)
--	end)
--end

local r = Instance.new('Sound')
r.Parent = game.Workspace
r.Volume = 500
r.SoundId = "rbxassetid://9314705681"
r.Name= " "
r:Play()
