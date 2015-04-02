--This loads and external file, they called it library loading, but I'm not sure if the term is being
--      overloaded yet or if this is the equivilant of lua libraries.

dofile("lualib.lua") -- load the library
n = norm(3.4, 1.0)
print(twice(n)) --> 7.0880180586677
