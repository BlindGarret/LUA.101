-- Global vars do not need to be declared, and accessing them before assignment results in Nil but not an error.
print(b) --> nil
b = 10
print(b) --> 10

--[[ that being said you don't really need to delete global variables usually, as if variables need a short
      life your should probably use a local one. But removing a global variable is simply setting it back
      to nil. a global variable only exists if the value is not nil.--]]
b = nil
print (b) --> nil : aka non-existant again or "cleaned up"
