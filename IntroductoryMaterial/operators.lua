        --> Arithmetic <--
print(1+1)  --> addition
print(1-1)  --> subtraction
print(1*1)  --> multiplication
print(1/1)  --> division
print(-1+1) --> urnary negation (negative numbers)
print(2^2)  --> this is a power function but its actually not a part of the core its in the standard math library.
                    --how this is linked is beyond me right now

        --> Comparison <--
print(1<2)
print(2>1)
print(2>=2)
print(2<=2)
print(2==2)
print(2~=1) --> Not equal... too bad I've gotten used to <> or !=

--[[ Equality: It's important to note. LUA considers values of different types to always be different, so no
            implicit conversion will be done. However values are compared as struct value equality if they are
            the same type... for the most part. Exceptions are Tables, Userdata and Functions, which do a reference
            equality.]]--
print(1==1)
print(1~="1")
a = {}
a.x = 1
b = {}
b.x = 1
c = a
print(a==c)
print(a~=b)

        --> Logical <--

--[[ And: Logical and, as expected. This however uses shortcut operations. And returns the first argument if it is
        false else returns the second argument. This seems like an odd implementation, but this will always use the
        shortest version of evaluation and, considering the boolean rules, mean it would still work in a conditional
        as expected.]]--
print(4 and 5)      --> 5
print(false and 6)  --> false

--[[ Or: Logical or, as expected. Opposite shortcircuit of and, returns first argument if true else return second.
        this has an odd benefit of making a workable null coalescence as, assuming the value isn't set to false, the
        only other thing that returns false is nil.]]--

print(false or 6)       --> 6
print(16 or 12)         --> 16
x = y or 6              --> x = y ?? 6 --> 6    remeber this breaks down if y was holding booleans, in which case you cant
                                                --tell the difference between a false or a nil.
x = 6; y = 7
max = (x > y) and x or y --> this is a functional max function as if X is greater than y, the and will return the second case
                            --in a short circuit, if not it returns false into the or statement which will return its second case
                            --instead. Very cool, and will seriously need to wrap my head around this stuff.
--[[ Not: nothing tricksy here, it returns the not of the current expression in boolean form]]--
print(not false)            --> true
print(not "Oh Hai")         --> false
print(not not not not true) --> true

        --> Concatination <--
print("oh " .. "hai")
print(0 .. 1)
a = "Hello"
b = a .. "World"
print('a :' .. a)
print('b :' .. b)
