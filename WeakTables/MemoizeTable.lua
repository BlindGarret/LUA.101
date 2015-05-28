--[[Memoize Functions: Oddly enough Kevin and I were just talking about this
                      the other day. Memorizing solutions to a function in order
                      to expedite the function calling. We weren't really sure
                      what was involved, but we made some guesses that were pretty
                      close to the mark. This can be done easily in LUA using weak
                      tables, which benefits from only storing answers between 
                      garbage collections, meaning that the most popular answers are
                      expedited but memory should fill up too painfully.]]--

--In this example we will make a function which "loadstring"s an inputted LUA block
--    This is a slow process which will be speeded up in the most used cases by memoizing

local results = {}
setmetatable (results, {__mode = "kv"}) --weak values and keys
function mem_loadString(s)
  if(results[s]) then
      return results[s]
  else
    local result = loadstring(s)
    results[s] = result
    return result
  end
end

--for a second example of usefulness take the instance of a system representing
--      objects as a singleton of some form, which are immutable and will need to
--      use some sort of value equality for. We can implement this with a memoized
--      factory so that value equality IS reference equality. Take the IPAddress 
--      example below:

local ipResults = {}
setmetatable(results, {__mode= "kv"}) --weak for keys and values
function BuildIpAddress(stringAddress)
  if(ipResults[stringAddress]) then
    return ipResults[stringAddress]
  else
    local ipAddress = {Port="2930", Address="stringAddress"}
    ipResults[stringAddress] = ipAddress
    return ipAddress
  end
end

--In this case a duplicate IP returns an already existing IP object, which is turn
--    makes reference equality equal to value equality. Notional singletons for
--    everybody!!