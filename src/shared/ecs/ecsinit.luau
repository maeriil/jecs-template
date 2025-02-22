--[[

	We want to require this file initially on both server and client

	The purpose of this file is to just enable debug mode
	Debug mode allows you to have better stack trace but probably should be turned off in live game?
	Im not fully sure the performance hit due to enabling it on live game, but while ur devving u should enable it

	The other thing is the JECS_HI_COMPONENT_ID
	This value is basically telling jecs that we will have at most 32 unique components in our game. There is this thing called
	jecs.Rest, which gives you an entity id that is the entity value after the Last Component. Can be useful in some cases
	Anyway, its better to leave this untouched, I recommend setting it up at like a high number initally and then bring it down once ur game is complete ish

	Something to keep in mind is that you generally will never have too much components. From my experience u will never cross 100 components
	so having something like 128/256 or even 64 is reasonable. The reason jecs demo uses 32 is because its super small game
]]

_G.JECS_DEBUG = true
--_G.JECS_HI_COMPONENT_ID = 32 --!! BEST TO LEAVE THIS COMMENTED OUT. See explanation above
require(game:GetService("ReplicatedStorage").Packages.jecs)
return 0
