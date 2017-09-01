require "../data_structures/min_heap"

def init_graph(graph, n, val = 2**32)
  for i in (0..n-1)
    graph[i] = []
    for j in (0..n-1)
      graph[i][j] = val
    end
  end
end

def get_adjacent(list, graph, cur, visited)
  i = 0
  row = graph[cur]
  while i < row.size
    if i != cur && row[i] >= 0 && (!visited.has_key?(cur) || !visited.has_key?(i))
      list.insert({ u: cur, v: i, w: graph[cur][i]})
    end
    i+=1
  end
end

def find_next_node(list, visited)
  node = list.remove
  if visited.has_key?(node[:u]) && visited.has_key?(node[:v])
    return find_next_node(list, visited)
  else
    return node
  end
end

def prims(start, graph)
  result = 0
  visited = Hash.new
  max_num_of_edges = graph.size-1
  i = 0
  current = start
  tree = Hash.new
  list = MinHeap.new
  while i < max_num_of_edges
    get_adjacent(list, graph, current, visited)
    next_node = find_next_node(list, visited)
    visited[next_node[:u]] = true
    visited[next_node[:v]] = true
    # tree["#{next_node[:u]}-#{next_node[:v]}"] = graph[next_node[:u]][next_node[:v]]
    result += graph[next_node[:u]][next_node[:v]].to_i
    current = next_node[:v]
    i+=1
  end
  return result
end

n, m = gets.strip.split(' ')
n = n.to_i
m = m.to_i
graph = []
init_graph(graph, n, -1)
for i in (0..m-1)
  u, v, weight = gets.strip.split(' ')
  u = u.to_i - 1
  v = v.to_i - 1
  if u != v
    graph[u][v] = graph[u][v].to_i > 0 ? [weight.to_i,graph[u][v].to_i].min : weight.to_i
    graph[v][u] = graph[v][u].to_i > 0 ?[weight.to_i,graph[v][u].to_i].min : weight.to_i
  end
end
# puts graph.to_s
puts prims(0, graph).to_s
# puts prims(0, [[-1, 3, 4, -1, -1], [3, -1, 5, 6, 2], [4, 5, -1, -1, 7], [-1, 6, -1, -1, -1], [-1, 2, 7, -1, -1]]).to_s
