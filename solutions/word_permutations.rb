# @param {String} s
# @param {String[]} word_dict
# @return {String[]}
def word_break(s, word_dict)
  local = []
  result = []
  i = 0
  while i < word_dict.size do
    word = word_dict[i]
    if "#{local.join}#{word}" == s[0, local.join.size + word.size]
      local << word
      solution(s, word_dict, local, 0, result)
      local.pop
    end
    i+=1
  end
  return result
end

def solution(s, word_dict, local, index, result)
  if local.join.size == s.size && local.join == s
    result << local.join(" ")
  else
    i = index
    while i < word_dict.size do
      word = word_dict[i]
      if "#{local.join}#{word}" == s[0, local.join.size + word.size]
        local << word
        solution(s, word_dict, local, i, result)
        local.pop
      end
      i+=1
    end
  end
end

puts word_break("catsanddog",
["cat","cats","and","sand","dog"]).to_s
puts word_break("bb",
                ["a","b","cd"]).to_s
puts word_break("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]).to_s
puts word_break("aaaaaaa",
["aaaa","aaa"]).to_s
puts word_break("aaaaaaa",
["aaaa","aa","a"]
).to_s