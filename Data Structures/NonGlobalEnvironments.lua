--[[Changing the environment: EXCELLENT. it appears I can change the global
      environment to a non-global one. This could be useful in an object oriented approach.]]--

a = 1
--change the current environment with setfenv
setfenv(1, {_G = _G }) --note the _G = _G. This is because _G isn't populated by default. Which
                            --means if you do not set this you lose your true global environment.
_G.print(a)     --> nil : note the _G. print isn't defined in this global environment...
_G.print(_G.a)  --> 1

_G.setfenv(1, _G) --reset for testing : Note the number represents the stack frame 
--1 = given function
--2 = calling function
--3 = ?? possibly it's calling function?

--you can also use this to inform inheritence. for example:
a = 1
local newEnv = {} --create new environment
setmetatable(newEnv, {__index = _G})
setfenv(1, newEnv)  --set it

print(a)    --> 1 : notice a is still 1. We inherited the values from the global including functions
a = 10
print(a)    --> 10 : seems reasonable
print(_G.a) --> 1 : but the global namespace is still unpoluted, as the sets are happening locally
_G.a = 20
print(_G.a)  --> 20 : still allowed to set specifically
