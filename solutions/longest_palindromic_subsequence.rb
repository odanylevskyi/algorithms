=begin
Given a string s, find the longest palindromic subsequence's length in s. You may assume that the maximum length of s is 1000.
Example 1:
Input:
"bbbab"
Output:
4
One possible longest palindromic subsequence is "bbbb".
Example 2:
Input:
"cbbd"
Output:
2
One possible longest palindromic subsequence is "bb".
=end

# @param {String} s
# @return {Integer}
def longest_palindrome_subseq(s)
  if s == s.reverse
    return s.size
  end
  len = s.size
  memo = []
  for i in (0..len)
    memo[i] = []
    for j in (0..len)
      memo[i][j] = -1
    end
  end
  return helper(s, 0, len-1, memo)
end

def helper(s, i, j, memo)
  if memo[i][j].to_i >= 0
    return memo[i][j]
  end
  if i > j
    return 0
  end
  if i == j
    return 1
  end

  if s[i] == s[j]
    memo[i][j] = 2 + helper(s, i+1, j-1, memo)
  else
    memo[i][j] = [helper(s, i+1, j, memo), helper(s, i, j-1, memo)].max
  end

  return memo[i][j]
end

def longest_palindrome_subseq1(s)
  len = s.size
  memo = Hash.new
  return recursive_helper1(s, len, memo)
end

def recursive_helper1(s, n, memo)
  if s.empty?
    return 0
  end
  if s.size == 1
    return 1
  end
  max = -1
  if memo.has_key?(s)
    return memo[s]
  end
  if s != s.reverse
    for i in (0...n)
      if i == 0
        substr = s[1, s.size-1]
      elsif i == s.size-1
        substr = s[0, s.size-1]
      else
        substr = "#{s[0, i]}#{s[i+1, s.size-1]}"
      end
      if !memo.has_key?(substr)
        res = recursive_helper1(substr, n-1, memo)
        memo[substr] = res
      else
        res = memo[substr]
      end
      max = [max.to_i, res.to_i].max
    end
  else
    max = s.size
  end
  memo[s] = max
  return max
end
puts longest_palindrome_subseq1("aaaabaaafaaaazeksa").to_i
puts longest_palindrome_subseq("euazbipzncptldueeuechubrcourfpftcebikrxhybkymimgvldiwqvkszfycvqyvtiwfckexmowcxztkfyzqovbtmzpxojfofbvwnncajvrvdbvjhcrameamcfmcoxryjukhpljwszknhiypvyskmsujkuggpztltpgoczafmfelahqwjbhxtjmebnymdyxoeodqmvkxittxjnlltmoobsgzdfhismogqfpfhvqnxeuosjqqalvwhsidgiavcatjjgeztrjuoixxxoznklcxolgpuktirmduxdywwlbikaqkqajzbsjvdgjcnbtfksqhquiwnwflkldgdrqrnwmshdpykicozfowmumzeuznolmgjlltypyufpzjpuvucmesnnrwppheizkapovoloneaxpfinaontwtdqsdvzmqlgkdxlbeguackbdkftzbnynmcejtwudocemcfnuzbttcoew").to_i
#"aaaabaaafaaaazeksa"
#"euazbipzncptldueeuechubrcourfpftcebikrxhybkymimgvldiwqvkszfycvqyvtiwfckexmowcxztkfyzqovbtmzpxojfofbvwnncajvrvdbvjhcrameamcfmcoxryjukhpljwszknhiypvyskmsujkuggpztltpgoczafmfelahqwjbhxtjmebnymdyxoeodqmvkxittxjnlltmoobsgzdfhismogqfpfhvqnxeuosjqqalvwhsidgiavcatjjgeztrjuoixxxoznklcxolgpuktirmduxdywwlbikaqkqajzbsjvdgjcnbtfksqhquiwnwflkldgdrqrnwmshdpykicozfowmumzeuznolmgjlltypyufpzjpuvucmesnnrwppheizkapovoloneaxpfinaontwtdqsdvzmqlgkdxlbeguackbdkftzbnynmcejtwudocemcfnuzbttcoew"