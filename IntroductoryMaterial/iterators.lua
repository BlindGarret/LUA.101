--[[ Iterators: If I'm reading this right Itterators are very c++ like in that you can design an iterator
            of your choice. We've been using a build in ipairs iterator which functions very similarly to
            a foreach of a dictionary, but that's an implementation detail apparently.]]--

--Simple list iterator. Unsure how threading works in this
function SimpleListIteration(t)           --> Using a factory so that there is a closure variable to keep track of index
    local i = 0
    local n = table.getn(t)         --> FML this looks alot like the count variable I manually implemented earlier -_-
    return function ()
        i = i + 1
        if i <= n then
            return t[i]             --> When this returns something the for loop will continue to iterate, at a nil it breaks.
        end
    end
end

function KvpInterator(a, i)
    i = i + 1
    local v = a[i]
    if v then
        return i, v
    end
end

function KvpInteration(a)
    return KvpInterator, a, 0
end

t = {"Hello", " ", "World", "!"}
local sentence = ""

for word in SimpleListIteration(t) do
    sentence = sentence .. word
end

--print(sentence)
