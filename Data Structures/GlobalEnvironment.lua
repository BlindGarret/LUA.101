--[[ Environment: the global variables are kept in a single table as far the the environment
                  is concerned, though i'm told this is actually an abstraction and a bit
                  of a lie. basically this means we can change the global environment table to
                  include functionality like option explicit. this will force us to declare 
                  global variables before using them along with a ton of other stuff.]]--

--Option Explicit (from vb)
setmetatable(_G, {    --_G is the name for the global table
    __newindex = function (_,n) --_ is used for a variable i don't intend to use.
      error("Attempt to write to undeclared variable " .. n , 2)
    end,
    __index = function(_,n)
      error("Attempt to read undeclared variable "..n, 2)
    end,
  })

--this makes statements such as this illegal
rawset(_G, "setnonexistant",    
  function ()
    a = 1
  end)
--> note i have to use rawset to declare the variable here, as setnonexistant as a function lives
      -- on the global table i just made readonly. rawset bypasses the metatable.

--setnonexistant() --> this would crash

--lets make this declaration easier
rawset(_G, "declare",
  function(name, val)
    rawset(_G, name, val or false) --> never nil
  end)

declare("a")

a = 10 --> this is now ok!
print(a) 

