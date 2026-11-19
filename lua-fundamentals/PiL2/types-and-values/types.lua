print(type('hello world'))
print(type(10.4*3))
print(type(print))
print(type(type))
print(type(true))
print(type(nil))
print(type(type(nil)))


-- vars no predefined types
print()
print(type(a))
a = 10
print(type(a))
a = 'a string!'
print(type(a))
a = print -- functiosn are first class
a(type(a))
print()

print(not not nil) -- false
print(not not false) -- false
print(not not 0) -- everything is true
print(not not '') -- true too
print()

-- Strings
a = 'one string'
b = string.gsub(a,'one','another')
print(a)
print(b)
print("one line\nnext line\n\"in quotes\", 'in quotes'")
print('a backslash inside quotes: \'\\\'')

-- literal strings
page = [[
<html>
<head>
<title>An HTML Page</title>
</head>
<body>
<a href="http://www.lua.org">Lua</a>
</body>
</html>
]]

print(page)

-- numeric operations on strings try to convert the string
print('10' + 1)
print('10 + 1')
print('-5.3e-10'*'2')
-- print('hello' + 1) --> error

-- similar if lua finds a number where a string should be
print(10 .. 20)
print()

-- line = io.read() -- read a line
-- n = tonumber(line) -- try to convert it to a number
-- if n == nil then
--   error(line .. ' is not a valid number')
-- else
--   print(n*2)
-- end

-- number to string with tostring() or .. with an ''
print(tostring(10) == '10')
print(10 .. '' == '10')
-- # works on strings
a = 'hello'
print(#a)
print(#'good\0bye')