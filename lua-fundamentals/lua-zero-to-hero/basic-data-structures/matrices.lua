--[[
Matrices:

In Lua, matrices can be implemented using tables of tables. Each element
in the matrix is represented by a value in a table, and rows are represented
by sub-tables within the main table


]]
-- examle of 3x3 matrix of zeros
local matrix = {}
for i = 1, 3 do
	matrix[i] = {}
	for j = 1, 3 do
		matrix[i][j] = 0
	end
end

-- or we can use again literal syntax with constructors
matrix1 = {
	{ 1, 2, 3 },
	{ 4, 5, 6 },
}

matrix2 = {
	{ 7, 8, 9 },
	{ 10, 11, 12 },
}

function addMatrices(m1,m2)
  local result = {}
  for i=1,#m1 do
    result[i] = {}
    for j=1,#m1[i] do
      result[i][j] = m1[i][j] + m2[i][j]
    end
  end
  return result
end

sumMatrix = addMatrices(matrix1,matrix2)

for i=1,#sumMatrix do
  print(table.concat(sumMatrix[i],", "))
end