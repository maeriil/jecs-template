local ReplicatedStorage = game:GetService("ReplicatedStorage")
local phases = require(ReplicatedStorage.shared.ecs.phases)
local scheduler = require(ReplicatedStorage.shared.ecs.scheduler)

local function test_system()
	print("running in shared")
end

scheduler.SYSTEM(test_system, phases.SteppedPhases.ReconcilePhase)

return 0
