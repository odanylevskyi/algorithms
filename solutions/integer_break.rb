# @param {Integer} n
# @return {Integer}
def integer_break(n)
  memo = Array.new(n+1)
  res = []
  max = 0
  sum = 0
  return num_break(n, n-1, memo, 1, res, sum, max)
end

def num_break(n, num, memo, i, res, sum, max)
  if sum == n
    m = res.inject(:*)
    return max > m ? max : m
  end
  while i < n
    res << i
    sum += i
    if sum <= n
      max = num_break(n, num-i, memo, i, res, sum, max)
    end
    res.pop
    sum-=i
    i+=1
  end
  return max
end

puts integer_break(5).to_s