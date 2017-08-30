# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  if a.size <= 2
    return 0
  end
  arr2 = []
  arr3 = []
  i = 1
  j = 0
  while i < a.size do 
    arr2[j] = (a[i] + a[i-1]).to_f/2
    j += 1
    i += 1
  end
  i = 2
  j = 0
  while i < a.size do 
    arr3[j] = (a[i] + a[i-1] + a[i-2]).to_f/3
    j += 1
    i += 1
  end
  i = 1
  pos = 0
puts arr2
  min = [arr2[0], arr3[0]].min
  while i < arr2.size do
    if (!arr3[i].nil? && arr3[i] < min) || arr2[i] < min
      pos = i
						min = !arr3[i].nil? ? [arr3[i], arr2[i]].min : arr2[i]
    end
    i += 1
  end
  return pos
end

puts solution([4, 2, 2, 5, 1, 5, 8])
