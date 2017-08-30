#!/bin/ruby

def get_distance_to_each_node(list, start)
  visited = Hash.new
  q = [start]
  distance = Hash.new
  (1..list.size).each {|i| distance[i] = -1}
  list[start].each do |v|
    distance[v] = 6
  end
  visited[start] = true
  while !q.empty? do
    current = q.shift
    puts q.to_s
    visited[current] = true
    list[current].each do |v|
      if !visited.has_key?(v)
        q << v
        visited[v] = true
        distance[v] = distance[current].to_i + 6 if distance[current].to_i > 0
      end
    end
  end
  distance.delete(start)
  return distance.values
end

q = gets.strip.to_i
for a0 in (0..q-1)
  n, m = gets.strip.split(' ')
  n = n.to_i
  m = m.to_i
  list = Hash.new
  (1..n).each {|i| list[i] = []}
  for a1 in (0..m-1)
    u, v = gets.strip.split(' ')
    u = u.to_i
    v = v.to_i
    list[u] << v
    list[v] << u
  end
  s = gets.strip.to_i
  distances = get_distance_to_each_node(list, s)
  distances.each {|value| print "#{value} "}
  puts ""
end