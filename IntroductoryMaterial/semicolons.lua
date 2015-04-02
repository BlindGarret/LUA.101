-- semicolons are optional so this is an equally legal factorial function
function Fact(n)
    if n == 0 then
        return 1;
    else
        return n * Fact(n-1);
    end
end

print("Enter a number: ");
a = io.read("*number"); --read a number
print(Fact(a));

--Honestly, while I'm often the kind of guy who prefers a semicolon at the end of all my lines, as
--  I am used to the C Language, I'm not sure if I like semi-colons in this type of code. The language feels
--  VB-ier than it is C-ier.
