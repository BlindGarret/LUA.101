--[[Memoize Functions: Oddly enough Kevin and I were just talking about this
                      the other day. Memorizing solutions to a function in order
                      to expedite the function calling. We weren't really sure
                      what was involved, but we made osme guesses that were pretty
                      close to the mark. This can be done easily in LUA using weak
                      tables, which benefits from only storing answers between 
                      garbage collections, meaning that the most popular answers are
                      expedited but memory should fill up too painfully.]]--

