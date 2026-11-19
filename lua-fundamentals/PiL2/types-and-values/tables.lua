--[[
Tables - 

This important so I want to type it out to ensure that I remember it:
The table type implements associative arrays. An associative array is 
an array that can be indexed not only with numbers, but also with strings
or any other value of the language, except nil. Moreover, tables have 
no fixed size; we can add as many elements as we want to a table dynamically.
Tables are THE main (in fact the only) data structuring mechanism in Lua, 
and a powerful one. We use tables to represent ordinary arrays, symbol tables,
sets, records, queues, and other data structures, in a simple, uniform, and efficient
way. Lua uses tables to represent modules, packages, and objects as well.
When we write io.read, we mean the read function from the io module. For Lua,
this means index the table io using the string read as the key.

Tables in Lua are neither values nor variables, they are objects. They
are like dynamically allocated objects and our programs manipulate only
references (or pointers) to them. There are no hidden copies or creation
of new tables behind the scenes. 

There is in fact no way to declare a new table. They are created by the
constructor expression which in its simplest form is {}
]]

a = {} -- create a table and store its reference in 'a'
print(a)
k = "x"
a[k] = 10 -- new entry, with key='x' and value=10
a[20] = "great" -- new entry, with key=20 and value='great'
print(a["x"])
k = 20
print(a[k])
a["x"] = a["x"] + 1
print(a["x"])
print()

-- a table is always anonymous. There is no fixed relationship between a
-- variable that holds a table and the table itself
a = {}
a["x"] = 10
b = a -- 'b' now refers to the same table as 'a'
print(b["x"])
b["x"] = 20
print(a["x"])
a = nil -- now only b refers to the table
b = nil -- no references left to the table now the gc can do its work
print()

a = {}
for i = 1, 1000 do
	a[i] = i * 2
end
print(a[9])
a['x'] = 10
print(a['x'])
print(a['y'])
print()

-- we also have the syntax sugar of
a.x = 10
print(a.x)
print(a.y)
print()

-- for a conventional array we just use a table with integer keys
-- size gets cloudy with arrays since they can have holes and any
-- index not initialized is just nil. But if we really need to
-- handle arrays with holes up to their last index we can use
-- the function table.maxn
a = {}
a[10000] = 1
print(#a)
print(table.maxn(a))

-- Just as '+1', '01', and '1' aren't equal, this can cause bugs when
-- used as table keys
i = 10; j = '10'; k = '+10'
a = {}
a[i] = 'one value'
a[j] = 'another value'
a[k] = 'yet another value'
print(a[j])
print(a[k])
print(a[tonumber(j)])
print(a[tonumber(k)])