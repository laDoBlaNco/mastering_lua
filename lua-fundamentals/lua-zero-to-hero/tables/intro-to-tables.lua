--[[
INTRODUCTION TO TABLES:

- The table IS the fundamental and powerful data structure in lua
- They serve as the primary way to represent arrays, dictionaries, sets,
  etc.
- A table is an array that accepts not only numbers as indices, but also
  strings or any other value of the language except nil. Similar to
  php's ordered maps or associative arrays
- Tables in Lua are neither values nor variables --> they are objects.


]]

-- numbers as indices
t = {} -- a table constructor
t[1] = 10 -- tables are 1-indexed
t[2] = 3

print(#t)

t[3] = 9

print(#t)

-- strings as indices
exam = {}

exam['John'] = 9
exam['Chris'] = 7.7
print(exam['John'])

print(t,exam) --printing a table shows its memory address

-- variables as indices
a = {}
k = 'x'
a[k] = 50
print(a[k])
print(a['x'])

-- passed by reference not value, similar to JS
y = {}
y['discovery'] = 20
z = y -- z now refers to the same table as y, y and z refer to the same 
-- underlying table in memory
print(y,z)
-- any modifications to one will alter the other's
print(z['discovery'])
z['discovery'] = 100
print(y['discovery'])

