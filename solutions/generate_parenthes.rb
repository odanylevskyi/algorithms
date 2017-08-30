# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  if n == 0
    return ""
  end
  str = "("*n+")"*n
  result = []
  local = ""
  memo = Hash.new
  build_perenthesis(n, 0, str, local, result, memo)
  return result
end

def build_perenthesis(n, i, str, local, result, memo)
  if i == n*2
    if is_valid(local)
      result << local
    end
    memo[local] = 1
    return
  end
  j = 0
  while j < str.size
    local += str[j]
    if local[0] != ")" && memo[local].nil?
      build_perenthesis(n, i+1, str, local,result, memo)
    end
    local = local[0, local.length-1]
    j+=1
  end
end

def is_valid(str)
  if str%2 == 1
    return false
  end
  stack = []
  i = 0
  j = 0
  while i < str.size
    while str[i] == "("
      stack << str[i]
      j+=1
      i+=1
    end
    while str[i] == ")"
      stack.pop
      j-=1
      i+=1
    end
    if j < 0
      return false
    end
  end
  return j != 0 ? false : true
end

# puts is_valid("(())")
# puts generate_parenthesis(10)

def generate_parenthesis2(n)
  result = []
  build_parenthesis2(n, result, "", 0, 0)
  return result
end

def build_parenthesis2(n, result, str, open, close)
  if str.size == 2*n
    result << str
    return
  end
  if open < n
    build_parenthesis2(n, result, str+"(", open+1, close)
  end
  if close < open
    build_parenthesis2(n, result, str+")", open, close+1)
  end
end

puts generate_parenthesis2(4)