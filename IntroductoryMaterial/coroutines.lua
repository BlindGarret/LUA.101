--[[ Coroutines : these are kind of like threads. It creates its on stack, local
variables, and basically its own clean work space. However they aren't actually
threads, and work much more like threads in a single core system where they share
time. a coroutine is collabrative in nature and only one coroutine is running at any
given time, with a coroutine sleeping only when it is told to. At least that is the
definition I read, which sort of implies that you can get into situations where you
are letting one thread run hogwild over the others fairly easily... worth looking into.
]]--

--Coroutines are kept under the coroutine table, and return type of thread.

--Of interest they appear to work very similarly to tasks in C# 
--      as they take functions(delgates

thread1 = coroutine.create(function () 
    print("hi") 
  end )

print(thread1)                    --> thread: just a standard 0x0000000 thread name

--Coroutines have three states (suspended, running, dead) and they start suspended.

print(coroutine.status(thread1))  --> suspended
coroutine.resume(thread1)         --> re/starts our coroutine printing hi
print(coroutine.status(thread1))  --> dead

--Doubly intereesting is that coroutines appear to be the way we can access yield
--    return style code, see below

function linq_style_iteration ()
  for i=1,10 do
    print("co",i)
    coroutine.yield()
  end
end

co = coroutine.create(linq_style_iteration)

coroutine.resume(co)   --> another way to resume, prints co 1
coroutine.resume(co)   --> co 2
coroutine.resume(co)   --> co 3
coroutine.resume(co)   --> co 4
coroutine.resume(co)   --> co 5
coroutine.resume(co)   --> co 6
coroutine.resume(co)   --> co 7
coroutine.resume(co)   --> co 8
coroutine.resume(co)   --> co 9
coroutine.resume(co)   --> co 10
coroutine.resume(co)   --> nothing....
coroutine.resume(co)   --> nothing....

print(coroutine.resume(co))   --> this is actually returning an error about not
                                  --being able to start a dead subroutine

--[[ You can use coroutines as iterators to solve complex issues that a standard iterator couldn't really solve. For example, traverse all permutations of a given array]]--

function permutationGenerator (a,n)
  if n == 0 then
    coroutine.yield(a)
  else
    for i=1,n do
      -- put i-th element as the last element
      a[n], a[i] = a[i], a[n]
      
      -- generate permutaions of other elements
      permutationGenerator(a, n-1)
      
      --restore i-th element
      a[n], a[i] = a[i], a[n]
    end
  end
end

function printResult(a)
  for i,v in ipairs(a) do
    io.write(v, " ")
  end
  io.write("\n")
end

function permutate(a)
  local n = table.getn(a)
  return coroutine.wrap(function() permutationGenerator(a,n) end)
end

for p in permutate({"a","b","c"}) do
  printResult(p)
end

--> b c a 
--> c b a 
--> c a b 
--> a c b 
--> b a c 
--> a b c 
