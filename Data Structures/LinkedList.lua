--[[ Linked List: yeah...I could have guessed this implementation. It's not tough when 
you have effectively a dictionary to work with...]]--

-- start us off verbosely
list = nil

-- insert first item
list = {next = list, value = 1}

-- lets keep adding
list = {next = list, value = 2}
list = {next = list, value = 3}
list = {next = list, value = 4}
list = {next = list, value = 5}
list = {next = list, value = 6}
list = {next = list, value = 7}

--time to traverse
local l = list
while l do
  print(l.value)
  l= l.next
end

--makes sense, and doubly linking would be just as trivial, however the book says
--    such a construct is usually way less efficient then what you could do, which
--    makes sense. I rarely find a doubly linked list needed.