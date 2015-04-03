--[[ We used empty constructors so far, but you can construct tables in many ways
        each one implying a slightly different collection type being used]]--

--Arrays/Sequences/Vectors/Lists
vector = {"Hello", "World", "Yup", "This", "Is", "A", "Thing"}  --> this creates a list with length of 7 starting at index 1
print(vector[3])
vector = {"Hello", tostring(1+64), "World", 2, true, 4, false}  --> yup arrays can contain differnt types and do not require constants
print(vector[1] .. vector[3])

--string keyed dictionary
myDict = {X="Hello", Y=1024, Z="Again"} --> this works like a string based dictionary
print(myDict.X .. myDict.Z)
print(myDict["X"] .. myDict["Z"])

-- this apparently implies a simple linked list implementation though it means i traverse it as a stack
for i,line in ipairs(vector) do
    lList = {next = lList, value = line}
end

l = lList

while l do
    print(l.value)
    l = l.next
end

--object keyed dictionary
objDict = {[true]="tensers", [false]="potion"}
print(objDict[true] .. ' ' .. objDict[false])
