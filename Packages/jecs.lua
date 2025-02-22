local REQUIRED_MODULE = require(script.Parent._Index["ukendio_jecs@0.5.3"]["jecs"])
export type Archetype = REQUIRED_MODULE.Archetype 
export type Record = REQUIRED_MODULE.Record 
export type Id<T > =
REQUIRED_MODULE.Id<T >
export type Pair<P, O> = REQUIRED_MODULE.Pair<P, O>
export type Entity<T > = REQUIRED_MODULE.Entity<T >
export type Query<T...> = REQUIRED_MODULE.Query<T...>
export type World = REQUIRED_MODULE.World 
return REQUIRED_MODULE
