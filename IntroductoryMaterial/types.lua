--[[ Lua is dynamically typed, so not type definitions. Note: unsure what this means about being able
        to setup objects, most likely non-object oriented? ]]

-- There are eight basic lua types : nil, boolean, number, string, userdata, function, thread, and table

print(type("Hello world"))  --> string
print(type(10.4*3))         --> number
print(type(print))          --> function
print(type(type))           --> function
print(type(true))           --> boolean
print(type(nil))            --> nil
print(type(type(X)))        --> string : this is always a string as because the return of function "type" is string

-- variables have no predefined types ergo this is legal:
print(a) --> nill
a = 10
print(a) --> now a number
a = "Not a number anymore!"
print(a) --> now a string
a = print -- whoops we can also set a to functions (think delegates via c#?)
a(type(a)) --> ergo print(type(print))

--[[ Nil: nil is much like null in that it's a non-value simply there to indicate a difference between
        having nothing returned, and simply not getting a return (the difference between zero and nothing).

     Booleans: old hat here, simple true false, only oddity here is that this language considers boolean false
        and nil as being false in a conditional, but anything else as true. This includes, for example, zero.

     Number: this is a Double. There don't seem to be ints, floats, or decimals. You can however recompile
        lua to change this fact, but meh doubles are fine IMO. Interestingly we can use scientific notation!

     String:]]--
