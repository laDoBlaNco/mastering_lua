--[[
FUNCTIONS WITH MULTIPLE RESULTS

- A quite convenient feature of Lua is that functions can return
  multiple results
- For example, suppose we have a sequence and wwant to find its maximumum
  value and the location where it takes place
]]

function maximum(s)
	local max_index = 1 -- initial case
	m = s[max_index]

	for i = 2, #s do
		if s[i] > m then
			m = s[i]
			max_index = i
		end
	end
	return m, max_index
end

print(maximum({ 8, 10, 25, 16, 9 }))
print()

--[[
A for loop is a programming construct that allows us to repeat a block
of code a specific number of times or iterate over a sequence of elements
]]

-- these are actual multiple return values and not a tuple or array
function f()
	return "a", "b", "c"
end

x,y,z = f()
print(z,y,x)
