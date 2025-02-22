local ReplicatedStorage = game:GetService("ReplicatedStorage")
local jecs = require(ReplicatedStorage.Packages.jecs)
local world = require(script.Parent.world)

type Tag<T = nil> = jecs.Entity<T>
type Id<T> = jecs.Id<T>

-- If our component needs data, we use :component, and type cast it using ID
local Player = world:component() :: Id<Player>

-- If you component does not need data, we can use :entity, and type cast it using Entity
local InGame = world:entity() :: Tag

return table.freeze({
	Player = Player,
	InGame = InGame,
})
