class DisjointSet
  attr_accessor :parents, :adjacent, :ranks
  def initialize
    @parents = Hash.new
    @adjacent = Hash.new
    @ranks = Hash.new
  end

  def make(a)
    @parents[a] = a
    @ranks[a] = 0
    @adjacent[a] = []
  end

  def union(a, b)
    left = @parents[a]
    right = @parents[b]
    if left != right
      if @ranks[left] >= @ranks[right]
        @parents[b] = @parents[a]
        @parents[right] = @parents[left]
        @adjacent[left] << right
        @adjacent[right].each do |el|
          @adjacent[left] << el
          @parents[el] = @parents[left]
        end
        @adjacent[right] = []
      else
        @parents[a] = @parents[b]
        @parents[left] = @parents[right]
        @adjacent[right] << left
        @adjacent[left].each do |el|
          @adjacent[right] << el
          @parents[el] = @parents[right]
        end
        @adjacent[right] = []
      end
      @ranks[left] += 1
    end
  end

  def find(a)
    return @parents[a]
  end
end

# disjoingSet = DisjointSet.new
# disjoingSet.make(1)
# disjoingSet.make(2)
# disjoingSet.make(3)
# disjoingSet.make(4)
# disjoingSet.make(5)
# disjoingSet.union(1,2)
# disjoingSet.union(3,4)
# puts "Set: #{disjoingSet.find(2)}"
# puts "Set: #{disjoingSet.find(4)}"
# disjoingSet.union(2,5)
# disjoingSet.union(1,3)
# puts "Set: #{disjoingSet.find(3)}"
# puts "Set: #{disjoingSet.find(5)}"
# puts disjoingSet.parents.to_s
# puts disjoingSet.ranks.to_s
# puts disjoingSet.adjacent.to_s

