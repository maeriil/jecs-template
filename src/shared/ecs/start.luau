local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local jabby = require(ReplicatedStorage.Packages.jabby)
local jecs = require(ReplicatedStorage.Packages.jecs)

local scheduler = require(script.Parent.scheduler)
local world = require(script.Parent.world)
local components = require(script.Parent.components)

local function start(modules)
	for _, module in modules do
		require(module)
	end

	-- Added this so we can attach name to each component
	for name, comp in pairs(components) do
		world:set(comp, jecs.Name, name)
	end

	local events = scheduler.COLLECT()
	scheduler.BEGIN(events)
	jabby.set_check_function(function(player)
		return true
	end)
	if RunService:IsClient() then
		local player = game:GetService("Players").LocalPlayer
		local playergui = player:WaitForChild("PlayerGui")
		local client = jabby.obtain_client()
		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.F4 then
				local home = playergui:FindFirstChild("Home")
				if home then
					home:Destroy()
				end
				client.spawn_app(client.apps.home)
			end
		end)
	end
end

return start
