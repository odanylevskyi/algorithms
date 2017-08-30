# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  sub_array_sum(nums, 0, nums.size-1)
end

def sub_array_sum(nums, left, right)
  if left == right
    return nums[left]
  else
    mid = (left+right)/2
    lSum = sub_array_sum(nums, left, mid)
    rSum = sub_array_sum(nums, mid+1, right)
    sum  = range_sum(nums, left, mid, right)
    return [lSum, rSum, sum].max
  end
end

def range_sum(nums, left, mid, right)
  sum = lSum = rSum = 0
  i = mid
  lSum = nums[mid]
  while i >= left
    sum += nums[i]
    if sum >= lSum
      lSum = sum
    end
    i-=1
  end
  i = mid+1
  sum = 0
  rSum = nums[i]
  while i <= right
    sum += nums[i]
    if sum >= rSum
      rSum = sum
    end
    i+=1
  end
  return lSum+rSum
end

puts max_sub_array([12,1,-3,4,-1,2,1,-5,4]).to_s