--[[StringBuilder:  Yup string are immutable, yes you know exactly why this is bad
                  while the reasoning seems slightly different the fact is that just
                  like in c# you dont want to keep concatting.]]--

local a_pretend_file = {"line1", "line2", "line3"}

local builder = {}
for k , v in ipairs(a_pretend_file) do
  table.insert(builder, v)
end
local string = table.concat(builder, "\n") --> second param is optional append
print(string)

--[[ this uses a "tower of hanoi" design, and is very efficient witha bonus for being 
implemented in c not lua]]--