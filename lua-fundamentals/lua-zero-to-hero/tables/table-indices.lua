--[[
TABLE INDICES

Each table can store values with different types of indices, and it grows
as needed to accommodate new entries

In Lua we represent ALL data structures with Tables

Lua supports this representation by providing t.name syntatic sugar for
t['name']

t = {}
t.x = 2       --  same as t['x'] = 2
t.h = 10      --  same as t['h'] = 10
t.x           --> 2 same as t['x']

]]

-- syntatic sugar
t = {}
t.x = 2
t.h = 10
print(t.x,t.h)
print()

--[[
NOTE: A common mistake for beginners is to confuse t.x with t[x]. The first
form represents t['x'], which is a table indexed by the string 'x'. The
second form is a table indexed by the value of the VARIABLE x
]]

-- common gotcha
t2 = {}
x = 'y'
t2[x] = 50 -- put 50 in field 'y'
print(t2[x]) --> 50 -- value of field 'y'
print(t2.x) --> nil -- value of field 'x' (undefined)
print(t2.y) --> 50 -- value of field 'y'

--[[
Finally, when used as a key, any float value that can be converted to an
integer is converted. For instance, when Lua executes a[5.0] = 10, it
converts the key 5.0 to 5. Float values that can't be converted to integers
remain unaltered. 🤔 But not sure why I would ever used a number as a key
]]


