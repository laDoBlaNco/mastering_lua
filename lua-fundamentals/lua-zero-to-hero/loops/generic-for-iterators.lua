--[[
Generic For and Iterators

Remember that the for statement as to variants, the numerical for and
the generic for

- The generic for loop traverses all values returned by an iterator 
  function - (in JS its the [symbol.iterator]() method in iterables and 
  generators)


]]

-- Example of iterator function
function iteratorFactory(collection)
	-- initialization code
	-- the 'iteratorFactory' returns the actual iterator function
	-- pairs and ipairs are example of iterator factories which return
	-- 3 values (the actual function, the invariant state, the starting control value)
	-- the iterator function returns the next value during each iteration
	return function()
		-- logic to generate and return next value
		-- stop iteration when there are no more values
	end
end

--[[
Its roughly the following according to Claude:
local f,s,i = ipairs(t) where:
f = the actual iterator function
s = the invariant state (the table t or the collection)
i = the starting control value (0)

The generic loop then runs f(s,i) repeatedly until the first value it
returns is nil

for i,v in ipairs(t) do ... end

is roughly in psuedoLua

local f,s,ctrl = ipairs(t)
while true do
  local i,v = f(s,ctrl)
  if i == nil then break end
  ctrl = i -- being the index starts on 0 so first iteration is 1
  --body
end
]]

-- Example iterator function
local function iter(t, i)
	i = i + 1
	local v = t[i]
	if v ~= nil then
		return i, v
	end
end

local function my_ipairs(t)
	return iter, t, 0 -- factory returns iterator, state,control
end

--[[
MORE CLAUDE:
pairs is different as it returns next,t,nil. The built-in 'next' function is
the real iterator, and pairs just hands it to the loop.

This is called a STATELESS iterator: the iterator function keeps no state
of its own, and the 'for' loop passes the state back in on every call.
The other kind is a closure based iterator, whwere the factory returns a closure
that keeps its own position in 'upvalues'. Coroutine based iterators build on that
This closure pattern makes sense as any time we are returning a function referencing
variables in an enclosing function, we are dealing with closures.

One note with Luau, it supports generalized iteration, so:
  for i,v in t do ... end works with no ipairs or pairs. 
]]

-- closure example to solidify what we are saying above
function outFunction(x)
	return function()
		print(x)
	end
end
local innerFunction = outFunction(42)
innerFunction() -- prints 42 even though the function prior is long off the stack
print()

--[[
Back to Udemy:
- The generic for is very powerful -> we can traverse almost anything in 
  a readable fashion
- Unlike the numerical for, the generic for can have multiple variables

]]

function myIterator(s)
	local index = 0 -- starts at 0 but first iteration is 1
	local length = #s

	return function() -- anony function closure
		index = index + 1
		if index <= length then
			-- also remember we can return more than 1 value
			return s[index], index
		end
	end
end

function genericFor(s)
	-- note that we don't use a number range as we have an iterator function
	for item, index in myIterator(s) do
		print(item, index)
	end
end

a = { "apple", "banana", "orange" }
genericFor(a)
print()

--[[
Below is another entry from Claude to go further down the rabbit hole:

Speaking specifically to the question if ipairs is an iterator or an
iterator factory: ipairs is NOT the iterator. It's a factory: A function
that returns the iterator function plus the state the iterator needs. 
'Programming in Lua' calls this kind of function a GENERATOR. The actual
iterator is a hidden internal function that ipairs hands back to us

What ipairs(t) actually returns calling it return 3 values:
]]
local iter, state, control = ipairs({ "a", "b", "c" })
print(iter) -- the real iterator function (internal)
print(state) -- the invariant state: the table
print(control) -- the initial control variable
print()

print("line 1:", iter(state, control))
print("line 2:", iter(state, 0))
print("line 3:", iter(state, 1))
print("line 4:", iter(state, 2))
print("line 5:", iter(state, 3)) --> end of sequence returns nothing
print("values returned:", select("#", iter(state, 3))) --> values returned: 0

--[[
The 3 parts of every generic for:
Iterator function -- called once per step -- for ipairs its internal iparsaux function
Invariant State -- Never changes during the loop -- the table t
Control Variable -- Changes each step; nil (or nothing) ends the loop -- starts at 0

so this: for i,v in ipairs(t) do body end

is basically doing this:
do
  local f,s,ctrl = ipairs(t)      -- expr list evaluated ONCE
  while true do
    local i,v = f(s,ctrl)         -- iterator called on EACH step
    if i==nil then break end
    ctrl = i                      -- first return value becomes new control
    --body
  end
end

So the for loop doesn't care at all about ipairs, it only needs something that
evaluates to a function and optional state. ipairs gives us that triple

pairs proves this

]]
print()
-- pairs(t) returns: next, t, nil
for k, v in pairs({ "a", "b", "c" }) do
	print(k, v)
end

-- this is identical but no factory, just using the builtin iterator 'next'
for k, v in next, { "x", "y", "z" } do
	print(k, v)
end
-- since pairs just returns func,invariant,nil we have what we need

--[[
The second form shows the architecture plainly: 'next' is the iterator, and pairs
is just packaging around it. 

Now writing our own STATELESS ipairs:
]]
print()

-- the ITERATOR a pure function of (state,ctrl)
local function ipairs_iter(t, i)
	i = i + 1
	local v = t[i]
	if v ~= nil then
		return i, v
	end
	-- at this tiem its returning nothing (nil) so it stops
end

-- The FACTORY: returns iterator + invariant state + initial control
local function another_ipairs(t)
  return ipairs_iter,t,0
end

for i,v in another_ipairs{'l','m','n'} do print(i,v) end
print()

--[[
THIS IS KEY: WHY THIS IS STATELESS AND WHY IT MATTERS:
ipairs_iter stores nothing. There is no closure, no function being returned. All its state
comes in through its args. That means:
  - No closure is allocated to heap per loop. The same function object is reused every time
  - No GC pressure. In a game loop running 60 times a second (Defold update()), this matters

So what does STATEFUL look like:
]]
local function values(t)
  local i = 0
  return function()   -- a NEW closure on every loop call point to its value of i
    i = i + 1
    return t[i]
  end
end
for v in values{1,2,3,4,5} do print(v) end

--[[
Here the factory returns ONLY an iterator. The iterator holds its state in it's
closure's upvalues (ptrs allocated to heap), and the for's state and control
slots go unused. This is more flexible (as we can return just values with no idex
as we see here or keep more complex state), but it ALLOCATES a closure on EVERY loop

Rule of thumb: prefer stateless iterators, or plain numeric. use closures when expressiveness
matters more than allocation.

Mental Model to click:

  ipairs, pairs, and string.gmatch are generators(factories).
  What they return is the actual iterator.
  The generic for only cares about the triple: (iterator, state, control)

So both ipairs and pairs are stateless since the iterators returned are functions
that keep nothing between calls and get everything they need from the (state, control)
arguments
]]
print()
print(ipairs{1,2,3}) -- uses index (position)
-- above iterator computes i=control + 1 and returns i,t[i]
print(pairs{1,2,3}) -- uses a key
-- above iterator is built-in 'next', a regular global function. next(t,k) returning
-- the key that comes after 'k' in the table's internal order, plus its value
-- next(t,nil) always returns the first entry
print()

local tab = {x=1,y=2,z=3}
local k,v = next(tab,nil) -- always first key IN INTERNAL ORDER NOT ORDER I PLACED THEM IN
print(k,v)

k,v = next(tab,k)
print(k,v)

print(next(tab,nil)) -- same first key I got before
--[[
Here the control variable is the previous key instead of a number, but the idea is the
same: everything comes in through the args.

Why 'next' is stateless but NOT simple:
ipairs does arithmetic. 'next' has to find 'k' inside the table each time (in the array part or in the
has part) and then move to the next slot. That has two consequences:
  1.The order is not defined. I found that out on the example. It follows the table's INTERNAL hash layout
    do can't be relied on
  2.Adding new keys during traversal is undefined behavior. It can trigger a rehash that moves everything
    and 'next' can then skip or repeat entries, or raise 'invalid key to next'.
    Changing or clearing (= nil) existing fields during a pairs loop is allowwed
    So clearing or changing OK, adding new key NOT

Summary:

ipairs ---> returns ipairsaux,t,0 ---> stateless ---> control var is index
pairs  ---> returns next,t,nil    ---> stateless ---> control var is prev key
string.gmatch(s,p) ---> a closure ---> stateful  ---> control var closures upvalue

Why table constructor order means nothing:
A table has two internal parts:

Array part ---> integer keys 1..n ---> iteration usually in order
Hash part  ---> everything else   ---> iteration slot order, decided by the hash of each key and collisions

{x=1,y=2,z=3} goes entirely to the hash part. Each key is placed at roughly hash(key) % size, and
next simply scans they slots from first to last. That order depends on the hash values,
the table size, collisions, and the history of inserts and deletes. It can also differ between
PUC Lua 5.1, LuaJIT, and Luau

When order matters, make it explicit:
]]
print()
--option 1 sort the keys
local keys = {}
for k in pairs(tab) do keys[#keys + 1] = k end
table.sort(keys)
for _,k in ipairs(keys) do print(k,tab[k]) end
print()

-- option 2 keep the order in an array from the start
local ordered = {{'x',1},{'y',2},{'z',3}}
for _,pair in ipairs(ordered) do print(pair[1],pair[2]) end

--[[
The Rule:
pairs when the order doesn't matter (counting, lookups, copying, etc) and
ipairs or sorted keys when it does. This is also a common source of flaky tests: a
test that compares pairs output against a fixed list can pass on one runtime and
fail on another. 
]]

