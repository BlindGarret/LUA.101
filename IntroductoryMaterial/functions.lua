--[[ Functions: first class citizens but otherwise they seem pretty normal.]]
function Factorial(inputNumber)
    if inputNumber == 0 then
        return 1
    end
    return inputNumber * Factorial(inputNumber - 1)     -->  After additional reading, I don't think this is actually recursive
end                                                             --it seems Lua properly handles tail recursion. Very nice.

print(Factorial(12))

function RefOrVal(input)
    input = 1000
end

local x = 10
print(x)                                    --> 10
RefOrVal(x)
print(x)                                    --> still 10 as parameters appear to not be references by default

function MultipleReturns(inputNumber)       --> a non-recursive factorial which also returns how many steps it took to get the answer
    local steps = 0
    local returnValue = inputNumber
    while inputNumber ~= -1 do
        inputNumber = inputNumber - 1
        if inputNumber == 0 then
            return returnValue, steps
        end
        steps = steps + 1
        returnValue = returnValue * inputNumber
    end
end

local val, steps = MultipleReturns(12)
print(val .. " in " .. steps .. " steps.")
print(MultipleReturns(12))                  --> 479001600       11


function LimitedMaxValue(x, y)              --> using multiple parameters
    return(x > y) and x or y
end

print(LimitedMaxValue(10,23))

function BetterMaxValue(...)                --> ellipses seems to roughly translate to args in c#, and it can be used in a func like (x,y,...)
    local count = 0                         --      obviously this is a bit more complex but it's the only way I know to do something like this
    local index = 1                         --      given my limited knowledge of this language, could do better if I knew how to iterate in more
    local list = {}                         --      than just the most basic way. I believe this complexity comes up to f(n-1), not great but could be worse.
    for i,v in ipairs(arg) do
        count = count + 1
        list[index] = v
        index = index + 1
    end
    if count == 2 then
        return ( list[1] > list[2] ) and list[1] or list[2]
    else
        list[1] = ( list[1] > list[count] ) and list[1] or list[count]
        list[count] = nil
        return BetterMaxValue(unpack(list))
    end
end

print(BetterMaxValue(100,99,98,97,96,101,10000,999,23,2.4))

--[[ Named Parameters: There isn't a nice clean way to name a parameters going into a function, but it is relatively easy to create an overload which
            can accomplish this. We use a small trick in that instead of parenthesis we use brackets. Basically it uses a table constructor as a parameter,
            which hands the function a table full of parameters listed by name. Luckily this allows us to name complex functions while with only one overload
            as optional values will simply be passed on as nil]]--

function SoComplexYouDontEvenKnow(x,y,z,c,b,v)
    return 42
end

function EasyPeasy(options)
    return SoComplexYouDontEvenKnow(options.x,options.y,options.z, options.c, options.b, options.v)
end

print(EasyPeasy{x=12,
          y=12,
          z=12,
          c=12,})

