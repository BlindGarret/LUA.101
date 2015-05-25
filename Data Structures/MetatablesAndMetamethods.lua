--[[ Metatables: This is kind of an odd section of the languages as I can't think
                  of anything which directly translates to this functionality except
                  maybe operator overloading? The description from the book says that
                  using a meta table= allows you to change behavior of tables, incuding things
                  like addition between tables and such, which screams operator overloading.
                  But this seems like a simplistic process, which makes me think there is
                  a deeper usecase than simple addition of sets of data.]]--
  
--Each table in LUA can have its own meta table, with a one meta table to many tables setup

t = {}
v = {}
t1 = {}

print (getmetatable(t)) -->   nil, as LUA instantiates with no metatables.

setmetatable(t,t1)
setmetatable(v,t1)  -->       can share a single metatable
setmetatable(t1,t1)  -->      can act as it's own metatable

print(getmetatable(t))
print(getmetatable(v))
print(getmetatable(t1))

--Example Linq style Set methods

Set = {}
Set.mt = {}

function Set.new (t)
  local set = {}
  setmetatable(set, Set.mt)
  for k, v in ipairs(t) do set[v] = true end
  return set
end

function Set.union(a,b)
  local res = Set.new{}
  for k in pairs(a) do res[k] = true end
  for k in pairs(b) do res[k] = true end
  return res
end

function Set.intersection(a,b)
  local res = Set.new{}
  for k in pairs(a) do
    res[k] = b[k]
  end
  return res
end

function Set.tostring(set)
  local s = "{"
  local sep = ""
  for e in pairs(set) do
    s = s .. sep .. e
    sep = ", "
  end
  return s .. "}"
end

function Set.print (s)
  print(Set.tostring(s))
end

Set.mt.__add = Set.union
Set.mt.__mul = Set.intersection

s1 = Set.new{10, 20, 30, 50}
s2 = Set.new{30, 1}
print(getmetatable(s1))
print(getmetatable(s2))

s3 = s1 + s2
Set.print(s3)
Set.print((s1 + s2)*s1)

--Def looks like operator overloading, which I've never been a fan of.
--LUA uses the first operands metatable if there is one, then if not moves to the seconds
--There are also overloads for equlity, < , and <= though none of the other relational operators
--    as the rest of them are implied as 'not' the other.
-- NOTE there is also an overload for tostring which is easier than the one I have above.

Set.mt.__tostring = Set.tostring

print(s3)

--__index: this allows us to set a default get, as far as I can tell, on a meta table. see below:

Window = {}
Window.default = {x = 0, y = 0, width = 100, height = 100}
Window.mt = {}
function Window.new (o)
  setmetatable(o, Window.mt)
  return o
end

Window.mt.__index = Window.default

w = Window.new {x = 10, y = 20}
print(w.width)    --> Defaults to 100 as per Window.default["width"]

-- set table to have default non-nil value

function setDefault(t,d)
  local mt = {__index = function() return d end}
  setmetatable(t, mt)
end

tab = {x = 10, y = 20}
print(tab.x, tab.z) -->   10  nil
setDefault(tab, 0)
print(tab.x, tab.z) -->   10  0

--Read-Only tables
-- This can be accomplished pretty easily by simply setting up a proxy table

function readOnly (t)
  local proxy = {}
  local mt = {      --create mt
    __index = t,
    __newindex = function(t,k,v)
      error("Attempt to update read-only table", 2) --redirect error to 2 levels up
    end
  }
  setmetatable(proxy, mt)
  return proxy
end

days = readOnly{"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
print(days[1])                            -->   Sunday

function totallyNotGoingToWork()
  days[2] = "not gonna work"
end

print(assert(totallyNotGoingToWork()))    -->   Fails
