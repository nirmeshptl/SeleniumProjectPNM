array = [1,2,3,4,5]
reverse=[]
i = -1
array.each do
  reverse << array[i]
  i-=1
end

print reverse