# @param {String} s
# @return {Integer[]}
def partition_labels(s)
  partitions = []
  hash = Hash.new
  for i in (0...s.size) do
    ch = s[i]
    hash[ch] = hash[ch].to_i + 1
  end
  current_hash = Hash.new
  len = 0
  for i in (0...s.size) do
    is_valid = true
    ch = s[i]
    current_hash[ch] = current_hash[ch].to_i + 1
    current_hash.each_key do |key|
      is_valid = is_valid && (current_hash[key].to_i == hash[key].to_i)
    end
    if is_valid
      current_hash = Hash.new
      partitions << len+1
      len = 0
    else
      len += 1
    end
  end
  return partitions
end

puts partition_labels("abbccccca").to_s