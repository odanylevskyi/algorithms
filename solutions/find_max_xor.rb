# @param {Integer[]} nums
# @return {Integer}
def find_maximum_xor(nums)
  max = mask = 0
  i = 3
  while i >= 0 do
    mask = mask | (1 << i)
    s2 = mask.to_s(2)
    set = Hash.new
    for n in nums do
      s0 = (n & mask).to_s(2)
      set[n & mask] = true
    end
    tmp = max | (1 << i)
    for n in set.keys do
      s1 = (tmp ^ n).to_s(2)
      if (!set[tmp ^ n].nil?)
        max = tmp
        break
      end
    end
    i-=1
  end
  return max
end


puts find_maximum_xor( [14, 11, 7, 2])