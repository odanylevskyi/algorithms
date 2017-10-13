# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  results = []
  results << []
  subsets_helper(nums, results, [], 0)
  return results
end

def subsets_helper(nums, results, list, pos)
  if pos == nums.size
    return ;
  end
  i = pos
  while i < nums.size do
    if !list.include?(nums[i])
      list << nums[i]
      subsets_helper(nums, results, list, i+1)
      results << list.dup
      list.pop
    end
    i+=1
  end
end

puts subsets([1,2,3]).to_s