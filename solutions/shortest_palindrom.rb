=begin
Given a string S, you are allowed to convert it to a palindrome by adding characters in front of it. Find and return the shortest palindrome you can find by performing this transformation.
For example:
Given "aacecaaa", return "aaacecaaa".
Given "abcd", return "dcbabcd".
=end

# @param {String} s
# @return {String}
def shortest_palindrome(s)
  r = s.reverse
  i = 0
  len = s.size
  idx = 0
  while i < s.size
    if r[i, len] == s[0, len]
      idx = i
      break
    end
    i+=1
    len -= 1
  end
  return "#{r[0, idx]}#{s}"
end

puts shortest_palindrome("aacecaaa")