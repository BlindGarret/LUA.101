--[[Colon style method signatures: this allows us to use syntactic sugar to hide
      the 'this' reference from code turning an Add(numOne,numTwo) into Add(numTwo)]]--

MyInt = {value = 0}
function MyInt:Add(numTwo)
  self.value = self.value + numTwo
end

function MyInt.Subtract(self,numTwo)
  self.value = self.value - numTwo
end

MyInt:Add(2)
print(MyInt.value)
MyInt:Subtract(2)
print(MyInt.value)
MyInt.Add(MyInt,2)
print(MyInt.value)
MyInt.Subtract(MyInt,2)
print(MyInt.value)
