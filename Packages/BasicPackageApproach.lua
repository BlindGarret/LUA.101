--[[Basic Package Definition: I've basically been doing this for the last
        few documents. you create a table, using it as a namespace.]]--

--complex number library: each number is represented as a table with two fields (r = real, i = imaginary)

complex = {}

function complex.new (r,i)
  return {r = r, i = i}
end

--define constant i
complex.i = complex.new(0, 1)

function complex.add(c1, c2)
  return complex.new(c1.r + c2.r, c1.i + c2.i)
end

function complex.sub(c1, c2)
  return complex.new(c1.r - c2.r, c1.i - c2.i)
end

function complex.mul(c1, c2)
  return complex.new(c1.r * c2.r - c1.i * c2.i,
                      c1.r * c2.i + c1.i * c2.r)
end

function complex.inv(c)
  local n = c.r^2 + c.i^2
  return complex.new(c.r/n, -c.i/n)
end

return complex