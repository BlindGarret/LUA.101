--[[ This simplifies declaration length as we dont need to keep typing complex everywhere...]]--
--define things locally to keep them private then export them as fuinctions in the end

local function new (r,i)
  return {r = r, i = i}
end

--define constant i
local i = new(0, 1)

local function add(c1, c2)
  return new(c1.r + c2.r, c1.i + c2.i)
end

local function sub(c1, c2)
  return new(c1.r - c2.r, c1.i - c2.i)
end

local function mul(c1, c2)
  return new(c1.r * c2.r - c1.i * c2.i,
                      c1.r * c2.i + c1.i * c2.r)
end

local function inv(c)
  local n = c.r^2 + c.i^2
  return new(c.r/n, -c.i/n)
end

complex = { --export public members.
  new = new,
  add = add,
  sub = sub,
  mul = mul,
  inv = inv,
  i = i
  }

return complex