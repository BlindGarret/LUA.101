--[[ Queues: not a terribly difficult implementation, though I'm honestly interested
      in the part where the book just showed me how to hide functions in tables as if
      they were namespaces.]]--
  
  Queue = {}
  function Queue.new()
    return {first = 0, last = -1}
  end
  
  function Queue.push(queue, value)
    local last = queue.last + 1
    queue.last = last
    queue[last] = value
  end
  
  function Queue.pop(queue)
    local first = queue.first
    if first > queue.last then error("Queue is empty") end
    local value = queue[first]
    queue[first] = nil
    queue.first = first + 1
    return value
  end
  
herp = Queue.new()
Queue.push(herp,"A")
Queue.push(herp,"B")
Queue.push(herp,"C")
Queue.push(herp,"D")

print(Queue.pop(herp))
print(Queue.pop(herp))
print(Queue.pop(herp))
print(Queue.pop(herp))
print(Assert(Queue.pop(herp))) -- Errors
    

  