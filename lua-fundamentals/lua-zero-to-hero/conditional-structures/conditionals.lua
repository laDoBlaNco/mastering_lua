--[[
- An if statement tests its condition and executes its 'then' or its
  'else' accordingly. The 'else' is optional
]]
v = -16
a = 75
b = 21
x = 35

if v < 0 then
	v = 0
end
print(v)
if a < b then
	print(a)
else
	print(b)
end
if x > 0 then
  print('approved')
else
  print('suspended')
end
