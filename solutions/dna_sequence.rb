# O(n*m)
def solution1(s, p, q)
  m = q.size
  i = 0
  result = []
  dna = {"A" => 1,"C" => 2, "G" => 3, "T" => 4}
  while i < m do 
    head = p[i].to_i
    tail = q[i].to_i
    min = dna[s[head].to_s].to_i
    while head <= tail do 
      min = [dna[s[head].to_s].to_i, dna[s[tail].to_s].to_i, min].min.to_i
      head += 1
      tail -= 1
    end
    result << min
    i += 1
  end
  return result
end
# O(n+m)
def solution2(s, p, q)
  m = q.size
  result = []
  i = 0
	 a = [s[0] == "A" ? 1 : 0]
		c = [s[0] == "C" ? 1 : 0]
		g = [s[0] == "G" ? 1 : 0]
  while i < s.size do
			a[i+1] = ( s[i] == "A" ? 1 : 0 ) + a[i]
			c[i+1] = ( s[i] == "C" ? 1 : 0 ) + c[i]
			g[i+1] = ( s[i] == "G" ? 1 : 0 ) + g[i]
			i += 1
  end
	 i = 0
		while i < m do
			if a[q[i]+1] - a[p[i]] > 0 
				result[i] = 1
			elsif c[q[i]+1] - c[p[i]] > 0 
				result[i] = 2
			elsif g[q[i]+1] - g[p[i]] > 0 
				result[i] = 3
			else 
				result[i] = 4
			end
			i += 1
		end
  return result
end
# CAGCCTA -> [2, 5] -> 2 -> 

puts "Solution #1: #{solution1('GGGGATTCAGCCTA', [2, 5, 0], [4, 5, 6]).to_s}"
puts "Solution #2: #{solution2('GGGGATTCAGCCTA', [2, 5, 0], [4, 5, 6]).to_s}"
