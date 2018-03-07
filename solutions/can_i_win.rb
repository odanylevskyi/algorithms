# @param {Integer} max_choosable_integer
# @param {Integer} desired_total
# @return {Boolean}
def can_i_win(max_choosable_integer, desired_total)
  visited = Hash.new
  results = Hash.new
  total_sum = 0
  for i in (1..max_choosable_integer) do
    visited[i] = false
    total_sum += i
  end
  if total_sum < desired_total
    return false
  end
  return helper(max_choosable_integer, desired_total, visited, 0, false)
end

def helper(max_choosable_integer, desired_total, visited, sum, is_first)
  if sum >= desired_total
    return is_first ? true : false
  end
  is_first = !is_first
  for i in (1..max_choosable_integer) do
    if visited[i] == false
      sum += i
      visited[i] = true
      if !helper(max_choosable_integer, desired_total, visited, sum, is_first)
        visited[i] = false
        sum -= i
        return false
      else
        return true
      end
    end
  end
end

puts can_i_win(10, 11) ? "YES, I can" : "No, I can't"