#!/bin/ruby
require 'benchmark'

def getWays(n, c)
  memo = Hash.new
  ways = coinChange(n, c, 0, memo)
  return ways
end

def coinChange(n, c, index, memo)
  if n == 0
    return 1
  end
  ways = 0
  key = "#{n}-#{index}"
  if !memo[key].nil?
    return memo[key]
  end
  c.each do |i|
    if n - i >= 0
      ways += coinChange(n-i, c, index+1, memo)
    end
  end
  memo[key] = ways
  return ways
end

def getWaysIt(n, c)
  memo = Array.new(n+1, 0)
  memo[0] = 1
  memo[1] = 1
  for i in 2..n
    for j in c
      if j <= i
        memo[i] += memo[i-j];
      end
    end
  end
  return memo[n];
end
ways = 0
time = Benchmark.measure {
  ways = getWays(110, [1,2,3])
}
puts ways
puts time.real
time = Benchmark.measure {
  ways = getWaysIt(110, [1,2,3])
}
puts ways.to_s
puts time.real
# {1,1,1,1}
# {1,1,2}
# {1,2,1}
# {2,1,1}
# {2,2}
# {1,3}
# {3,1}
