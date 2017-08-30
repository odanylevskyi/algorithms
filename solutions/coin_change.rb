#!/bin/ruby
require 'benchmark'

def getWays(n, c)
  memo = Array.new(n+1, 0)
  memo[0] = 1
  i = 0
  while i < c.length do
    coin = c[i]
    while coin <= n
      memo[coin] += memo[coin-c[i]]
      coin+=1
    end
    i+=1
  end
  return memo[n]
end

ways = 0
time = Benchmark.measure {
  ways = getWays(10, [2,5,3,6])
}
puts ways
# {1,1,1,1}
# {1,1,2}
# {1,2,1}
# {2,1,1}
# {2,2}
# {1,3}
# {3,1}
