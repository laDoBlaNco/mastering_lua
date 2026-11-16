--[[
TYPES AND VALUES:

- Lua is a dynamically typed language
- A language is dynamically-typed if the type of a variable is checked
  during run-time
- On the other hand, a language is statically typed if the type of a 
  variable is known at compile-time (Luau) instad of run-time

- Lua is also a weak-typed language
- A programming language is weakly typed, when it does not require
  the explicit specification of different types of objects and variables
- On the other hand, a language is strongly typed if it demands the specification
  of data types

- There are eight basic types in Lua: nil, Boolean, number, string, 
  userdata, function, thread, and table.
  
    type(nil)           --> nil
    type(true)          --> boolean
    type(10.4*3)        --> number
    type('Hello lua')   --> string
    type(io.stdin)      --> userdata
    type(print)         --> function
    type(type)          --> function
    type({})            --> table
    type(type(x))       --> string


]]
