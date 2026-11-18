--[[
Repeat Statement

- A repeat-until statement repeats its body until its condition is true
  Similar to do-while in other langs with the condition reversed
- This statement wiil always execute at least once since it tests the  condition
  after the body.

  repeat
    code block
  until condition_to_exit
]]
--[[
print('Example 1')

local count = 1
repeat
  print('Count: ' .. count)
  count = count + 1
until count > 5 
--]]

--[[
print('Example 2')
local i = 1
repeat
  print('Inside loop ' .. i)
  i = i + 1
  if i == 4 then break end
until i > 5

print('Outside loop ' .. i)
--]]

---[[
print('Example 3')
local i = 1
repeat
  local j = 1
  repeat
    print('i: ' .. i .. 'j: ' .. j)
    j = j + 1
  until j > 3
  i = i + 1
until i > 2
--]]
