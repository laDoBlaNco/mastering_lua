--[[
INPUT AND OUTPUT

Input:
We can use io.read() to read input from the user via the standard input
stream. This function allows us to read a line of text from the user.

Output:
To display output to the user, we can use the print() function. If we want
to print without a newline, we can use io.write()


]]

io.write('Enter your name: ');
name = io.read()
print('Hello, ' .. name .. '!')