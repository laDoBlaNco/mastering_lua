--[[
Implemenation of Stacks in Lua

- Stacks can be implemented in Lua using tables
- Since stacks follow the LIFO principle, we can use Lua tables to mimic
  this behavior

]]

-- create an empty stack
local stack = {}

function push(element)
	table.insert(stack, element)
end

function pop()
	table.remove(stack)
end

function isEmpty()
	return #stack == 0
end

function top()
  return stack[#stack]
end

push(3)
push(5)
print(top())
push(8)
print(top())
print(isEmpty())
pop()
print(isEmpty())
size = #stack
print(size)
pop()
pop()
print(top())
print(isEmpty())
