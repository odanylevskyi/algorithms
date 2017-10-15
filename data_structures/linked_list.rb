class LinkedList
  attr_accessor :root

  Node = Struct.new(:data, :next)

  def initialize
  end

  def insert_node(data, node)
    if node.next.nil?
      node.next = Node.new(data)
    else
      current = node.next
      while !current.next.nil?
        current = current.next
      end
      current.next = Node.new(data)
    end
  end

  def insert(data)
    if @root.nil?
      @root = Node.new(data)
    else
      insert_node(data, @root)
    end
  end

  def remove_node(data, node)
    if node.data == data
      @root = node.next
    else
      prev = node
      current = node.next
      while !current.next.nil? && current.data != data
        current = current.next
        prev = prev.next
      end
      if current.next.nil? && current.data == data
        prev.next = nil
      else
        prev.next = current.next
      end
    end
  end

  def remove(data)
    unless @root.nil?
      remove_node(data, @root)
    end
  end

  def print_list
    current = @root
    while !current.next.nil?
      print "#{current.data}->"
      current = current.next
    end
    print "#{current.data}"
    puts ""
  end
end


list = LinkedList.new
list.insert(1)
list.insert(2)
list.insert(3)
list.insert(4)
list.insert(5)
list.remove(5)

list.print_list