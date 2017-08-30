# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  if matrix.empty?
    return false
  end
  n = matrix.size-1
  m = matrix[0].size-1
  i = 0
  is_exists = false
  while i <= n && !is_exists
    is_exists = binary_search(matrix[i], target, 0, m)
    i+=1
  end
  return is_exists
end

def binary_search(array, target, l, r)
  if l > r
    return false
  end
  mid = (l+r)/2
  e = array[mid]
  if e == target
    return true
  end
  if target > e
    binary_search(array, target, mid+1, r)
  else
    binary_search(array, target, l, mid-1)
  end
end

puts search_matrix(
[],
1
# [
#    [1,   2,  7, 11, 15],
#    [3,   5,  8, 12, 19],
#    [4,   8,  9, 16, 22],
#    [10, 13, 14, 17, 24],
#    [18, 21, 23, 26, 30]
# ],
# 31
).to_s
