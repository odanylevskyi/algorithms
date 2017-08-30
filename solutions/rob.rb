def rob(nums)
  len = nums.size
  return 0 if len == 0
  return nums[0] if len == 1
  i = 2
  while i < len do
    if i - 3 < 0
      nums[i] += nums[i-2]
    else
      nums[i] = [nums[i-2]+nums[i], nums[i-3]+nums[i]].max
    end
    i+=1
  end
  return [nums[len-1], nums[len-2]].max
end

puts rob([2, 1, 3, 4, 6, 7,3, 1]).to_s