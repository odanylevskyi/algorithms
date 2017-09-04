=begin
Given a string, your task is to count how many palindromic substrings in this string.
The substrings with different start indexes or end indexes are counted as different substrings even they consist of same characters.
Example 1:
Input: "abc"
Output: 3
Explanation: Three palindromic strings: "a", "b", "c".
Example 2:
Input: "aaa"
Output: 6
Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
Note:
The input string length won't exceed 1000.
=end
# @param {String} s
# @return {Integer}
def count_substrings_recursive(s)
  palindroms = []
  for i in (0...s.size) do
    count_substrings_helper(s, "", palindroms, i)
  end
  puts palindroms.to_s
  return palindroms.size
end

def count_substrings_helper(s, substr, palindroms, i)
  if substr.size == 1
    palindroms << substr
  end
  if palindrom?(substr) && substr.size > 1
    palindroms << substr
  end
  if i < s.size
    substr += s[i]
    count_substrings_helper(s, substr, palindroms, i+1)
    substr.chomp(s[i])
  end
end

def palindrom?(s)
  s == s.reverse
end

def count_substrings_iterative(s)
  count = 0
  for i in (0...2*s.size) do
    left = i / 2
    right = left + i%2
    while left >= 0 && right < s.size && s[left] == s[right]
      count+=1
      left-=1
      right+=1
    end
  end
  return count
end

puts count_substrings_iterative("aaaaa").to_s
puts count_substrings_recursive("aaaaa").to_s