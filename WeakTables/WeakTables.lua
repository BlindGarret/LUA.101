--[[ Weak Tables: Like C++ there is a notion of weak references. This is great for keeping
                    lists of live objects without actually keeping a reference that the
                    garbage collector cares about.]]--
  
  --lets create a weak table, this is done in the __mode field which accepts a string.
  -- if the string contains 'k' all keys are weak
  -- if the string contains 'v' all values are weak
  
  a = {}              --our table
  b = {} 
  b.__mode = "k"      --b is now a table with weak keys
  setmetatable(a, b)  --a now has weak keys
  
  key = {} 
  key2 = {} 
  a[key] = "key1"
  a[key2] = "key2"
  
  collectgarbage() --force garbage collection
  
  for k, v in pairs(a) do print(v) end 
  -- this will output both keys one and two as while the table is weak, we still have two
  --      string refs in the case of our variables 'key' and 'kay2'
  
  key = nil --lose the strong ref
  
  collectgarbage() --force garbage collection
  
  for k, v in pairs(a) do print(v) end 
  -- this will only output 'key2' as all strong refs to key were removed thus removing it from the
  --      weak table
  

