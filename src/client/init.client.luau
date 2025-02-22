local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ecs = ReplicatedStorage.shared.ecs
require(ecs.ecsinit) -- So we can enable debug mode
local start = require(ecs.start)

local client_systems = script.systems:GetChildren() :: { ModuleScript }
local shared_systems = ReplicatedStorage.shared.systems:GetChildren() :: { ModuleScript }
local systems = { table.unpack(client_systems), table.unpack(shared_systems) }
start(systems)
