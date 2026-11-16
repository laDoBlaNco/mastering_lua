--[[
Write a function that given a natural number n returns the
square and the square root of this number
]]

p1 = function(n)
  return n^2,math.sqrt(n)
end

print(p1(9))
print(p1(4))
print(p1(2))
print(p1(1000))