require '../data_structures/disjoint_set'

def kruskal_mst(edges, n)
  result = []
  ds = DisjointSet.new
  i = 1
  while i <= n
    ds.make(i)
    i+=1
  end
  edges = edges.sort do |a, b|
    if a.weight < b.weight
      1
    elsif a.weight > b.weight
      -1
    else
      a.origin+a.weight+a.dest < b.origin+b.weight+b.dest ? 1 : -1
    end
  end
  while !edges.empty?
    edge = edges.pop
    if ds.find(edge.origin) != ds.find(edge.dest)
      ds.union(edge.origin, edge.dest)
      result << edge
    end
  end
  return result.collect(&:weight).inject(&:+)
end

Edge = Struct.new(:origin, :dest, :weight)

edges = []
n = 0
m = 0
File.foreach('tests/kruskal.txt').with_index do |line, i|
  if i == 0
    n, m = line.strip.split(' ')
    n = n.to_i
    m = m.to_i
  else
    origin, dest, weight = line.strip.split(' ')
    origin = origin.to_i
    dest = dest.to_i
    weight = weight.to_i
    edges << Edge.new(origin, dest, weight)
  end
end
# puts edges.to_s

puts kruskal_mst(edges, n).to_s