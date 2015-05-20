--[[Persistence: We gain one huge benfit from using lua, and that is that a settings
      file can simply be a list of table declarations. If we read and write files in
      such a way we gain the ability to use a pattern which strikingly reminds me of
      the visitor pattern to load a file. Example:]]--
      
local count = 0
function Entry (b) count = count + 1 end
dofile("data")
print("Number of entries: " .. count)

--[[ See what happened? we set up Entry as a funtion, then when the data file attempted
      to declare the data tables it instead fed them in as parameters to the function. 
      Seriously reminisent of working with ANTLR4's visitors. Lets go deeper!]]--

local authors = {}
local books = {}
local counter = 1
function Entry (b) 
  authors[counter] = b.author
  books[counter] = b.book
  counter = counter + 1
end
dofile("data")
for i = 1, count do
  print(authors[i] .. " : " .. books[i])
end

-- pretty freaking shnazzy now onto doing the serializing
function serialize_internal(o)
  if type(o) == "number" then
    io.write(o)
  elseif type(o) == "string" then
    io.write(string.format("%q", o)) -- formats the string to escape " chars
  elseif type(o) == "table" then
    io.write("{\n")
    for k,v in pairs(o) do
      io.write("  [\"")
      io.write(k)
      io.write("\"] = ")
      serialize_internal(v)
      io.write(",\n")
    end
    io.write("}\n")
  else
    error("cannot serialize a " .. type(o))
  end
end

function serialize(o, name)
  io.write(name)
  serialize_internal(o)
end
-- and in action
serialize({a=12, b='Lua', key='another "one"'}, "Entry")