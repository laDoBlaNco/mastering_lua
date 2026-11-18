--[[
Arrays

We implement arrays in Lua simply by indexing tables with integers. Therefore
arrays do not have fixed size, but grow as needed. Usually, when we
initialize the array we define its size indirectly
]]

local a = {} -- new array
for i=1,1000 do
  a[i] = 0
end
print(#a)

--[[
We can also use table constructors {} to create and initialize arrays
in a single expression, similar to array literals in other languages
]]
squares = {1,4,9,16,25,36,49,64,81}
print(#squares)

