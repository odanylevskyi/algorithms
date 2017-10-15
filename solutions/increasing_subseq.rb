=begin
Given an integer array, your task is to find all the different possible increasing subsequences of the given array, and the length of an increasing subsequence should be at least 2 .
    Example:
    Input: [4, 6, 7, 7]
Output: [[4, 6], [4, 7], [4, 6, 7], [4, 6, 7, 7], [6, 7], [6, 7, 7], [7,7], [4,7,7]]
Note:
    The length of the given array will not exceed 15.
    The range of integer in the given array is [-100,100].
    The given array may contain duplicates, and two equal integers should also be considered as a special case of increasing sequence.
=end

# @param {Integer[]} nums
# @return {Integer[][]}
def find_subsequences(nums)
  result = Hash.new
  list = []
  for i in (0...nums.size)
    list << nums[i]
    helper(nums, result, list, i+1)
    list.pop()
  end
  return result.values
end

def helper(nums, result, list, i)
  if i == nums.size
    return
  end
  for j in (i...nums.size)
    if nums[i-1] <= nums[j]
      list << nums[j]
      if list.size >= 2 && !result.has_key?(list.join('-'))
        result[list.join('-')] = list.dup
      end
      helper(nums, result, list, j+1)
      list.pop()
    end
  end
end

puts find_subsequences([4,6,7,7]).to_s