--[[Inheritence: This is very similar to object initialization, and uses basically the 
                  same constructs. However unlike inheritence in languages I am used to
                  this inheritence is mostly a fiction. Yes it works like inheritence, however 
                  you don't actually need to make whole new classes to extend functionality
                  as you can simply add a method to a single instance of a class, modifying it without
                  making that obvious. This will require some self restraint.]]--

--example of inheritence
a = {}

function a:new()
  local object = {}
  setmetatable(object, self)
  self.__index = self
  return object
end

function a:hello()
  print("Hello!")
end

b = a:new()           --ostensibly b is an a, however we will actually use b as a child class

function b:hello()
  print("Hola!")
end

objB = b:new()        --objB is now of type b as the "self" in the constructor would now be aiming at b
objA = a:new()        --objA is now of type a

objB:hello()          -->Hola!
objA:hello()          -->Hello!

--now is gets kinda grey as this is not actually class inheritence

objC = b:new()        --another object b
function objC:hello() --err... not a new class as such, though technically it is as we could certainly inherit from it
  print("Hallo!")
end

objC:hello()          -->Hallo! 
--although this was actually meant to be used as a object of type b, we extended its functionality without extending it's type
--    other instances of b will not have this extension making the types technically different while being notionally the same.

--Accessing base class functions
a.hello(objC)         -->Hello!
b.hello(objC)         -->Hola!
objC.hello(objC)      -->Hallo!