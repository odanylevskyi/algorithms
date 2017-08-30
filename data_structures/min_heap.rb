class MinHeap
  attr_accessor :elements

  def initialize(input = [])
    build(input)
  end

  def right_child(n)
    right = 2*n+2
    if right >= @elements.size
      return nil
    end
    return right
  end

  def left_child(n)
    left = 2*n+1
    if left >= @elements.size
      return nil
    end
    return left
  end

  def parent(n)
    if n <= 0 || n >= @elements.size
      return nil
    end
    return ((n-1)/2).floor.to_i
  end

  def build(input)
    if @elements.nil?
      @elements = []
    end
    for el in input
      insert(el)
    end
  end

  def move_down(i)
    l = left_child(i)
    r = right_child(i)
    min = i
    if !l.nil? && @elements[l] < @elements[i]
      min = l
    end
    if !r.nil? && @elements[r] < @elements[min]
      min = r
    end
    if min != i
      tmp = @elements[i]
      @elements[i] = @elements[min]
      @elements[min] = tmp
      move_down(min)
    end
  end

  def move_up(i)
    parent = parent(i)
    if i > 0 &&  @elements[i] < @elements[parent]
      tmp = @elements[i]
      @elements[i] = @elements[parent]
      @elements[parent(i)] = tmp
      move_up(parent)
    end
  end

  def insert(el)
    @elements << el
    i = @elements.size - 1
    move_up(i)
  end

  def remove
    if @elements.empty?
      return nil
    end
    root = @elements[0]
    @elements[0] = @elements.pop
    move_down(0)
    return root
  end

  def min
    if @elements.empty?
      return nil
    end
    return @elements[0]
  end
end

minHeap = MinHeap.new([2, 3, 1, 5])
puts minHeap.elements.to_s
puts minHeap.min
puts minHeap.remove
puts minHeap.elements.to_s
puts minHeap.remove
puts minHeap.elements.to_s