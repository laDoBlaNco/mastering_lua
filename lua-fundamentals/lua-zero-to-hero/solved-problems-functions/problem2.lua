--[[
Write a function that given a positive integer n, returns the largest
prime number smaller than n
]]

require('math')

function is_prime(x)
  if x < 2 then return false end
  for i=2,math.sqrt(x) do
    if x % i == 0 then
      return false
    end
  end
  return true
end


function p2(n)
  for i=n-1,2,-1 do
    if is_prime(i) then
      return i
    end
  end
  return nil
end

print(p2(20))
print(p2(35))
print(p2(116))