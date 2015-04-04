--[[ If statements : Basically the same they always are, with
            false and nil meaning false and all else meaning true]]--

local a = 16
if a>10 then
    print(a)
end

if a < 20 then
    print("low")
else
    print("high")
end

if a == 15 then
    print("15")
elseif a == 16 then
    print("16")
else
    print("invalid")
end

--   While Loop: Yup...

local i = 1
while i <= 100 do
    print(i)
    i = i + 1
end

--[[ Repeat Until Loop : This is a do loop in every way ]]
repeat
    print(i)
    i = i - 1
until i == -1

--[[ Numeric For Loop : A for loop]]
for i=0,100,1 do -- for <declare>,<max>,<stepValue>
    print(i)
    if i == 99 then
        break
    end
end

--[[ Generic For Loop : This is a foreach loop, but like C++ you can write your own iterators]]
a = {}

for i=0,100,1 do
    a[i] = i*i
end

for i,v in ipairs(a) do -- a kvp ipairs iterator
    print(i .. ':' .. v)
end
