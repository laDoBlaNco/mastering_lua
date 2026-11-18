--[[
While Loop:

- a while loop repeats its body while a condition is true

- Lua first tests the condition. If the condition is false, then the
  loop ends. Otherwise, Lua executes the body of the loop and repeats
  the test
]]

local count = 10
while count > 0 do
  print(count)
  count = count - 1
end
print('Blast off!')
