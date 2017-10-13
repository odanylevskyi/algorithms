=begin
A message containing letters from A-Z is being encoded to numbers using the following mapping:
'A' -> 1
'B' -> 2
...
'Z' -> 26
Given an encoded message containing digits, determine the total number of ways to decode it.

For example,
    Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).

The number of ways decoding "12" is 2.
=end

# @param {String} s
# @return {Integer}
def num_decodings(s)
  n = s.size
  if n == 0 || s[0].to_i == 0
    return 0
  elsif n == 1
    return 1
  end
  memo = []
  for i in (0..n-1) do
    memo[i] = 0
  end
  memo[0] = 1
  i = 1
  while i < n do
    num = "#{s[i-1]}#{s[i]}".to_i
    if num > 26 && s[i].to_i == 0
      return 0
    end
    if num <= 26 && num > 9
      memo[i] = i > 1 ? memo[i-2] : 1
      if s[i].to_i > 0
        memo[i] += memo[i-1]
      end
    elsif num > 0
      memo[i] = memo[i-1]
    end
    i+=1
  end
  return memo[n-1]
end

["301", "101", "111", "112", "4321", "1234", "10", "100"].each do |s|
  puts num_decodings(s).to_s
end