--[[
ARRAYS, LISTS, SEQUENCES:

In Lua Arrays and Lists are sequences

- To represent a conventional array or a list, we simply use a table with
  integer keys
- There is neither a way nor a need to declare a size, we just initialize
  the elements we need

]]

-- read 5 lines and store values in a table
t = {}
--[[
for i = 1, 5 do
	t[i] = io.read()
end
--]]


--[[
IMPORTANT:
- Usually when we manipulate a list we should know its length
- For instance, after we read 5 lines into a list, it is easy to know that its
  length if 5, because its numeric keys are 1,2,...5
- This technique only works if the list does not have HOLES, which are nil
  elements inside it. We call such a list without holes a sequence
- Why does this matter? lists or arrays with holes don't give accurate lengths
  so only sequences give accurate lengths with '#'
]]

a = {}
a[1] = 9
a[2] = 95
a[10] = 106
-- {9,95,nil,nil,nil,nil,nil,nil,nil,106} more or less
print(#a) --> 2 as it only counts up until the first hole
--[[
The sequence of the table a above is only 2, the only part of a without holes
- For sequences, Lua offers the length operator (#)
- On tables, it gives the length of the SEQUENCE represented by the table

]]
polygon = {
  color = 'blue',
  {x = 0, y = 0}, -- polygon[1]
  thickness = 3,
  {x = -20, y = 0}, -- polygon[2]
  {x = -20, y = 5}, -- polygon[3]
  npoints = 4,
  {x = 0, y = 5}, -- polygon[4]
}
print(#polygon) -- interestingly even if there aren't any holes, the length is only
-- looking at the number indices, not the records in the table. 🤯🤯🤯

--[[
Formally a sequence is a table where the positive numeric keys comprise a 
set {1,....,n} for some n in sequence (no holes) even if separated by other entries
in a mixed structure.

- The length operator also provides a useful idiom for manipulating sequences:

  a[#a + 1] = p -- appends 'p' to the end of the sequence

  so similar to .append in python or .push in JS

- It is important to bear in mind that the length operator is unreliable for
  lists with holes (nils). It only works on sequences.
]]
