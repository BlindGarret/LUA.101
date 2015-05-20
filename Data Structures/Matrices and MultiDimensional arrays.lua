--[[ Matrices: multidimensional arrays can be formed in two fairly predicatble ways.
        The first is by simply creating an array of arrays, the obvious definition.
        The second is by using some clever math to transform it into a flat array]]--
  
  --Option 1
  local n = 2
  local m = 2
  mt = {}
  for i=1,n do
    mt[i] = {}
    for j=1,m do
      mt[i][j] = 0 --2x2 matrix
    end
  end
-- def a bit verbose, but it does allow interesting shapes of arrays if, for whatever
--    reason those are needed.

--Option 2
mt2 = {}
for k=1,n do
  for l=1,m do
    mt2[i*m+j]=0 --2x2 array
  end
end
--less verbose, and flat which could have speed implications??? unsure...

--[[ Of interest, apparently tables in lua can always be sparse, no need to
implement a sparse matrix. All you do is keep the sparse spots nil and it won't eat
up memory.]]--