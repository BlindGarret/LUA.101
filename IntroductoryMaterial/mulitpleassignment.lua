--[[ Lua supports multiple assignment, which I am generally against,
        however apparently later you can return multiple values from a single
        function, meaning I'm going to keep and open mind and assume this isn't useless.]]--

x, y = 3, 4     --> x = 3; y = 4
x, y = 3        --> x = 3 ; y = nil
x, y = x, y     --> swaps x and y
x, y = 3, 4, 5  --> x = 3; y = 4; silently drop 5
function M ()
    return 3, 5
end
x, y = M()
print(x)
print(y)
