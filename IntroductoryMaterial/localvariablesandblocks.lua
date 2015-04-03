--[[ Local variables work as expected, using blocks for scope in
        the same way C# uses brackets. Of note, local variables are
        apparently faster to access than globals, though you don't seem
        to gain any speed by declaring close to use, however I still think
        it's a better practice to do so.]]--

x = "hello"                     --> global
local _x = "world"              --> local

for i=0, 5 do
    local _x                    --> implicit = nil
    _x = "Clarise"              --> choose block local over chunk local
    print(i .. x .. '' .. _x)   --> uses the local version of _x to this block
end

for i=0, 5 do
    print(i .. x .. '' .. _x)   --> no existant block local, so uses local version to this chunk
end


--[[ Kind of like the odd {} in C#, you can force a scope with a single run do loop]]--
do
    local _x = 3
    print(_x)
end
