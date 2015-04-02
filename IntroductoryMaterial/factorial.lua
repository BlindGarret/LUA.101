-- Define a factorial function
function Fact (n)
    if n == 0 then
        return 1
    else
        return n * Fact(n-1)
    end
end

print("Enter a number: ")
a = io.read("*number") --read a number
print(Fact(a))
