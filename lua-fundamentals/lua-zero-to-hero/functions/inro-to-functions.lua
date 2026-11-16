--[[
In programming, a function is a named block of code that performs a
specific task or operation

We can think of a function as a mini-program within our larger program.
Just like we can break down a complex task into smaller subtasks, 
functions allow us to break down our code into smaller,
manageable pieces. 

- In Lua functions are the main mechanism for abstraction of statements and
  expressions
- They can both carry out a specific task or compute the return values.
  In the first case, we use a function call as a statement; in the second
  case, we use it as an expression
]]
print(5 * 6, 6 / 5)
a = math.sin(2) + math.cos(10)
print(os.date())

--[[
- In Lua, functions are considered 'first-class citizenz', meaning they
  can be assigned to variable4, passed as arguments, stored in tables,
  and treated like any other data type

- A list of arguments enclosed in ()s denotes the call; if that call
  has no arguments, we still must write an empty list () to denote it.
  There is a special case to this rule: if the function has one single
  argument and that argument is either a string literal or a table constructor
  then the ()s are optional
]]
print()
print("Lost Island") --> print('Lost Island')
print()

--[[
- As we saw earlier a function definition in Lua as a conventional syntax
  but as in other languages this is syntatic sugar as what's actually happening
  is that an anonymous function is being set to a variable.
]]

function calculateSum(sequence)
	local sum = 0
	for i = 1, #sequence do
		sum = sum + sequence[i]
	end
	return sum
end

print(calculateSum({ 1, 2, 3, 4, 5 }))

--[[
- In Lua, it is possible to call a function with a different number of
  arguments compared to the number of parameters specified in the
  function definition. Luaz handles this situation by adjusting the
  number orguments to match the number of parameters. If there are 
  more arguments than parameters, Lua simply discards the extra
  arguments. Conversely, if there are more parameters than arguments,
  Lua assigns the addition parameters the value nil like JS assigns
  'undefined' Very similiar behavior there. 
]]

print()
function f(x, y)
	print(x, y)
end

print(f())
print(f(3))
print(f(3, 4))
-- print(f(3, 4, 6)) -- commented out to avoid the warning 
