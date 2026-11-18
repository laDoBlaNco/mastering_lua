--[[
Nested Conditions:

- A nested conditional refers to the situation where one conditional
  statement (such as an if statement) is nested within another conditonal
  statement
- In Lua we can use the elseif keyword as well
- This allows for more complex branching logic and multiple conditions
  to be evaluated.
]]

score = 85

if score >= 90 then
  print('Grade: A')
elseif score >=80 then
  print('Grade: B')
elseif score >= 70 then
  print('Grade: C')
elseif score >= 60 then
  print('Grade: D')
else
  print('Grade: F')
end
