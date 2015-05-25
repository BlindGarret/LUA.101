--[[ Here is a better way to make a package, where forgetting to type local wont
      pollute the global namespace, and where it's far more obvious whether functions
      are local members or global methods.]]--
      
local package = {}    --declare the packages table
complex = package     --declare the packages global namespace

--here we define any functionality we need to use from the global namespace or other packages
--this is a bit explicit, but it acts as self documenting code from the perspective of requirements

local io = io
local print = print

setfenv(1, package)   --ok now change the environments to give us a good clean slate


function new (r,i)
  return {r = r, i = i}
end

--define constant i
i = new(0, 1)

function add(c1, c2)
  return new(c1.r + c2.r, c1.i + c2.i)
end

function sub(c1, c2)
  return new(c1.r - c2.r, c1.i - c2.i)
end

function mul(c1, c2)
  return new(c1.r * c2.r - c1.i * c2.i,
                      c1.r * c2.i + c1.i * c2.r)
end

function inv(c)
  local n = c.r^2 + c.i^2
  return new(c.r/n, -c.i/n)
end

return complex