--[[Arrays: Aren't really arrays. I mean ignoring the obvious fact that everything
      is a table, they still aren't really arrays. They are more like Vectors or
      List<T>, as there size isn't set except by convention.]]--
      
--typical instantiation of an array
a = {} 
for i=1,100 do
  a[i] = 0  --Setup so that everything which is technically outside the array is nil
end

--It is customary to index at 1... FML
--You can also create an array in a single line as such
squares = {1,4,9,26,25,36,49,64,81}