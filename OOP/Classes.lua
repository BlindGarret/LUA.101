--[[Classes: Not going to be insulting by defining what a class is. There are no actual classes in
            LUA, but there is a prototype system, which seems to use a form of inheritance to
            instantiate objects]]--            

--simple prototype instantiation
b = {}
function b.print()
  print("Herp")
end

a = {}
setmetatable(a, {__index = b}) --Sets a's prototype to B, so when there is a call which a doesn't have it checks B

a.print()   --> Herp

-- a constructor

c = {}
function c:new()
  local object = {}
  setmetatable(object,self)
  self.__index = self
  return object
end

function c:print()
  print("Derp")
end

d = c:new()
d:print()