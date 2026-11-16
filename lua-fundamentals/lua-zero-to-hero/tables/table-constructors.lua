--[[
TABLE CONSTRUCTORS:

- Constructors are expressions that build and set up tables. They represent a
  unique aspect of Lua and are among it most valuable and flexible
  mechanisms.
- The most basic constructor is the empty constructor, represented by {} as
  demonstrated earlier. Constructors can also initialize lists. For example:
]]

days = {'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday',
  'Saturday',
}
print(days[6]) --> Friday
print()

--[[
- Lua also offers a special syntax to initialize a record-like table to represent
  structured data with named fields or attributes. For example:
]]

local person = { -- local scope, only accessible in this block or function
  name = 'John',
  age = 30,
  occupation = 'Engineer',
}

--[[
- We can also mix record-style with list-style initializations in Lua.
  For example:
]]
polygon = {
  color = 'blue',
  {x = 0, y = 0}, -- polygon[1]
  thickness = 3,
  {x = -20, y = 0}, -- polygon[2]
  {x = -20, y = 5}, -- polygon[3]
  npoints = 4,
  {x = 0, y = 5}, -- polygon[4]
}
-- the mix here is that anything we didn't given an index to, gets the integer
-- index automatically of a list
print(polygon[2].x,polygon[3].y)
