# @param {Integer[]} nums
# @return {Integer}
def majority_element1(nums)
  hash = Hash.new
  for i in nums
    if hash[i].nil?
      hash[i] = 1
    else
      hash[i] += 1
    end
  end
  m = 0
  hash.each do |key, value|
    if value > (nums.size/2).floor
      m = key
    end
  end
  return m
end

# puts majority_element1([3,2,3]).to_s


def majority_element2(nums)
  hash = Hash.new
  for i in nums
    if hash[i].nil?
      hash[i] = 1
    else
      hash[i] += 1
    end
  end
  m = 0
  hash.each do |key, value|
    if value > (nums.size/3).floor
      m = key
    end
  end
  return m
end

puts majority_element2([3,2,3, 3]).to_s