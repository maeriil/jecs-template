local scheduler = require(script.Parent.scheduler)

--[[

	A simple example of how to get started with using Phases
	Phases are just entity ids. The scheduler uses this to understand what systems should
	run in what order.

	The scheduler provides a great api on how to create your own phases. See a sample example below.
	In this example, we will add some order to the Stepped event. We will have 3 phases

	1) Setup = This phase will be used to setup our raycasts
	2) Raycast = This phase will be used to actually perform the raycast
	3) Reconcile = This phase will be used to reconcile the results of the raycast, basically read our results and do something with it
]]

local create_phase = scheduler.PHASE

local SetupPhase = create_phase({
	-- Here we are saying that SetupPhase will run after PreSimulation
	-- Refer to the roblox's Task Scheduler to understand the render order https://create.roblox.com/docs/studio/microprofiler/task-scheduler
	after = scheduler.phases.PreSimulation,
})

-- Once we setup the SetupPhase, it returns an entity. This is value we can use to "chain" our phase order
local RaycastPhase = create_phase({
	-- Here we are telling the scheduler that RaycastPhase will run after the Setup Phase. This is possible because SetupPhase is an entity reference
	-- to the phase we create earlier
	after = SetupPhase,
})

local ReconcilePhase = create_phase({
	after = RaycastPhase,
})

return {
	SteppedPhases = {
		SetupPhase = SetupPhase,
		RaycastPhase = RaycastPhase,
		ReconcilePhase = ReconcilePhase,
	},
}
