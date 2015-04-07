--[[Require: acts like include but uses hint pathing instead of absolute]]--
require "iterators" --checks locally ?;?.lua;

t = {"Hello", " ", "World", "!"}
local sentence = ""

for word in SimpleListIteration(t) do
    sentence = sentence .. word
end

print(sentence)
