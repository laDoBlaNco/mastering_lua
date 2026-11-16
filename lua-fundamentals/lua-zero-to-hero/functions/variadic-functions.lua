--[[
VARIADIC FUNCTIONS

A function in Lua can be variadic, that is, it can take a variable
number of arguments.

As a simple example, the following function returns the
summation of all of its arguments
]]
-- Like the rest operator in js, we use ... which captures all args in a {} list
add = function(...)
  local s = 0
  -- this is a generic for loop as it uses an iterator and not a specific range or length
  for _,v in ipairs{...} do -- this always tripped me up but we are seeing here
  -- the special case of a function without ()s ipairs just takes a constructor {}
    s = s + v
  end
  return s
end

print(add(1,2,3,4,5));

--[[
Aside:
In Lua, the ipairs iterator returns two values during each iteration:
the index and the corresponding value of a table. It is used to traverse
arrays or tables with consecutive integer keys starting from 1.
]]
print()
local myTable = {10,20,30}
for index,value in ipairs(myTable)
do
  print(index,value)
end

print()

local test = function(...)
  print (type(...))
  print(...)
end
test(1,2,3,4,5)