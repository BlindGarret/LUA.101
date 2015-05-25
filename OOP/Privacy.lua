--[[Method Privacy: In LUA there isn't actually a notion of privacy for methods. The language
                    wasn't actually designed to be used in programs which are complicated and
                    large enough to require such facilities, and privacy is mostly notional.
                    However it is possible to implement objects with privacy if you jumpm through a few hoops.]]--

function newA() --constructor, or maybe factory is more appropriate, for class a
  local printLocal = function (string) print("[" .. string .. "]") end
  local hello = function () printLocal("Hello") end          -- dont use ':' notation. all calls to self should be local
  local goodbye = function () printLocal("GoodBye") end
  return {hello = hello,
          goodbye = goodbye}
end

objA = newA()
objA.hello()        --> [Hello]
objA.goodbye()      --> [GoodBye]
objA.printLocal()   --> Error this is nil

--I feel like this would get complicated for inheritence, or possibly not depending on how it's done.