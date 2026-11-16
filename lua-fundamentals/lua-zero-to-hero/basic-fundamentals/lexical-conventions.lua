--[[
- Identifiers (or names) in Lua can be any string of letters, digits, 
  and underscores, not beginning with a digit, for example:

    I   j   x   i10   _ijx    aLongNameIsHere   _INPUT

  We should avoid identifiers starting with an _ followed by one or more
  upper-case letters (e.g., _VERSION); they are reserved for special use
  in Lua

  Usually, the identifyer _ (a single underscore) is reserved for anonymous
  variables

- The following words are reserved (we can't use them as identifiers)

  and   break   do      else      elseif
  end   false   for     function  goto
  if    in    ` local   nil       not
  or    repeat  return  then      true
  until while

- Lua is case-sensitive: and is reserved but And and AND are two
  different identifiers

- A comment starts anywhere we have two consecutive hyphens (--) and
  runs until the end of the line. Lua also offers long comments, which start
  with two hyphens followed by two opening square brackets and run until
  the first occurrence of two consecutive closing square brackets, like this
  actual comment this text is inside of

- Lua needs no separator between consecutive statements, but we can use a semicolon
  if we wish for readability. Line breaks play no role in Lua's syntax. 
  For instances, the following four chunks are all valid and equivalent:
  (NOTE: chunks in lua are simply blocks of statements/code)
    a = 1
    b = a * 2

    a = 1;
    b = a * 2;

    a = 1; b = a * 2

    a = 1 b = a * 2   -- ugly, but valid
]]

