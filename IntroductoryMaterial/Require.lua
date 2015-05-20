--[[Require: acts like include but uses hint pathing instead of absolute.
              It also does not reload files which have already been loaded,
              though this is case sensitive]]--
              
  --[[ Require doesn't use simple hint pathing technically, it uses ANSI C pathing
        which has no notion of directories. This means you basically list a bunch
        of patterns and it will insert the file name into these patterns then check
        for each patterns existance. 
        Example ?;?.lua;C:\lua\lib\?;/usr/lib/?
        Question marks will be replaced with the file name during the command.
        This roughly translates to "Check for the following files in order with filename 'myfile':
        myfile
        myfile.lua
        C:\lua\lib\myfile
        /usr/lib/myfile]]--
  --[[ Lua will search for this pathing pattern in the global LUA_PATH and 
      the environment LUA_PATH variables in turn before defaulting to something 
      like ?;?.lua]]--

LUA_PATH = "?;?.lua;C:\\lua\\lib\\?;/usr/lib/?"
require "iterators" --checks locally ?;?.lua;

t = {"Hello", " ", "World", "!"}
local sentence = ""

for word in SimpleListIteration(t) do
    sentence = sentence .. word
end

print(sentence)
