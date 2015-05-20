--[[Errors are handled through the return of the given chunk by the looks.
    Instead of some type of exception system, when an error happens the current
    chunk simply returns with nil and the error information apparently. While this is
    basically an "if not then error() end" call, it is simplified for us down to
    assert(method, errormessage).]]--
    
  print "Enter a number:"
  n = io.read()
  n = assert(tonumber(n), "invalid input:") --Good
  n = assert(tonumber(n), "invalid input: '" .. n .. "' is not a number" ) --Less good
  --since assert is technically a function it will evaluate the invalid input concatinations regardless of whether it will need to throw the error or not. This is inefficient.