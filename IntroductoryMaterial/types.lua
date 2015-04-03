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
print(a)        --> nill
a = 10
print(a)        --> now a number
a = "Not a number anymore!"
print(a)        --> now a string
a = print       -- whoops we can also set a to functions (think delegates via c#?)
a(type(a))      --> ergo print(type(print))

--[[ Nil: nil is much like null in that it's a non-value simply there to indicate a difference between
        having nothing returned, and simply not getting a return (the difference between zero and nothing).]]--
print(z)

--[[ Booleans: old hat here, simple true false, only oddity here is that this language considers boolean false
        and nil as being false in a conditional, but anything else as true. This includes, for example, zero.]]--
print(true)

--[[ Number: this is a Double. There don't seem to be ints, floats, or decimals. You can however recompile
        lua to change this fact, but meh doubles are fine IMO. Interestingly we can use scientific notation!]]--
print(3)
print(3.4)
print(1000000)

--[[ String: Yep, its a string of characters... Immutable as expected, large strings aren't to be feared.
        double brackets show literal strings. Gives automatic conversion between string and number, meaning
        any numeric operation put on a string attempts to convert to number. The opposite is true as well. '..'
        is the concat operator btw. This does not mean "10" and 10 are the same however.]]--
print("\<yo\>")
print([[<yo>]])
print("3" + 12 * "1e-10")
print(10 .. 20)

--[[ Tables: this is a bit of an oddity... It seems like a dictionary in structure, but it appears to take the place
        of a list/dictionary/etc... you can index by any type of variable like a dictionary. Tables appear to be
        dynamic objects which store pointers to your values, sort of like a list of objects in c#. No copies are made
        regardless of it being a value or reference object by c# definition. Of note, the table variable is a pointer
        to the object. I'm pretty sure this behaves the same as c#, but it takes a new meaning with a dynamic language.
        In essence the table is an anonymous object whos reference is held in a variable, you can swap it around to differnt
        variables without creating copies. The guide says lua stores global variables in tables. This makes sense as you can
        safely access the variables before initialized. Indexs apparently start at one in this language customarily... sigh...]]--
myTable = {}
myTable["AnIndex"] = 3
myTable[3] = "We can mix index types safely"
myTable[true] = "Perhaps this implies a hashset?"
newTableVar = myTable
myTable = 3
print(newTableVar[myTable])     --> this seems masturbatory but fun to code.
print(newTableVar.AnIndex)      --> syntactic sugar, good to know.
print(newTableVar.myTable)      --> NOT the same thing this means newTableVar["myTable"]... odd design choice but ok.
newTableVar = nil               --> and with all references gone, so is the table. I think the GC in this language is non-deterministic?

a = {}                          --> All arrays are basically lists as they are dynamically sized, but you can still use a table as an array
for i=1,5 do                    --> create array
    a[i] = i*2
end

for i,line in ipairs(a) do      --> Itteration over an array, though honestly this seems more analagous to a foreach(var kvp in dict) from c#
    print(line)
end

for key,value in ipairs(a) do   --> perhaps this syntax makes that more obvious. certainly simple to get used to.
    print(key .. ':' .. value)
end

--[[ Functions: First-Class citizens in lua, making me feel like I'm going to find out there are no classes. Though i'm pretty sure this
        isn't a functional language. It claims great support for both OO and Functional though, so perhaps i'm being short sighted. You
        know it's never struck me before, but the reason this doesn't feel odd to me is that I'm kind of used to this in C#. methods
        aren't first class citizens in C#, but with the heavy use of lambdas and delegates in our current codebase at work I've gotten used
        to thinking of them as such. Since C# Actions and Funcs allow you to treat them as if they were objects. Worth contemplating.]]--
function herp(a)
    return a*2
end

b = herp
print(b(herp(b(6))))

--[[ You can force conversion with functionality, these are tryparses by the looks returning nil in failure ]]--
print(tonumber("10") == 10)
print(tostring(10) == "10")
print(tonumber("herp") == nil)
