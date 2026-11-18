--[[
Numerical For:

The for loop as two variants: numerical for and generic for.

A numerical for as the followwing syntax:

  for var = exp1, exp2, exp3 do
    something
  end

This loop will execute 'something' for each value of var from 'exp1'
to 'exp2' using 'exp3' as the step to increment var

The 'exp3' is optional. When absent, Lua assumes 1 as the step value.

Consider a numerical for that counts even numbers to 20
]]
for i = 2,20,2 do
  print(i)
end

--[[
A very important aspect of the numerical for is that the control variable
is a LOCAL variable declared by the for statement, and it is visible ONLY
INSIDE the loop. A common mistake is to assume that the variable still
exists after the loop ends

We can access the value of the control variable anytime we want and save
it outside the loop very simply
]]
print()

a = {1,43,56,34,12,-9,67,55}

local found = nil
for i=1,#a do
  if a[i] < 0 then
    found = i -- save value of 'i'
    break -- break out of the loop
  end
end
print(found)
