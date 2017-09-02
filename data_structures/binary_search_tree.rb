class BinarySearchTree
  attr_accessor :root

  TreeNode = Struct.new(:data, :parent, :left, :right)

  def initialize(data)
    @root = TreeNode.new(data)
  end

  def insert_node(data, node)
    if node.data > data
      if node.left.nil?
        node.left = TreeNode.new(data, node)
      else
        insert_node(data, node.left)
      end
    else
      if node.right.nil?
        node.right = TreeNode.new(data, node)
      else
        insert_node(data, node.right)
      end
    end
  end

  def insert(data)
    insert_node(data, root)
  end

  def find(data)
    find_node(data, root)
  end

  def find_node(data, node)
    if node.nil?
      return nil
    end
    if data == node.data
      return node
    elsif data < node.data
      find_node(data, node.left)
    else
      find_node(data, node.right)
    end
  end

  def remove_leaf(node)
    if node.parent.left == node
      node.parent.left = nil
    else
      node.parent.right = nil
    end
  end

  def successor(node)
    if node.left.nil?
      remove_node(node)
      return node
    end
    if !node.left.nil?
      successor(node.left)
    end
  end

  def remove_node(node)
    unless node.nil?
      if node.parent.nil? && node.left.nil? && node.right.nil?
        self.root = nil
      elsif node.left.nil? && node.right.nil?
        remove_leaf(node)
      elsif !node.left.nil? && !node.right.nil?
        successor = successor(node.right)
        successor.parent = nil
        successor.left = node.left
        unless successor.left.nil?
          successor.left.parent = successor
        end
        successor.right = node.right
        unless successor.right.nil?
          successor.right.parent = successor
        end
        if node.parent.left == node
          node.parent.left = successor
        else
          node.parent.right = successor
        end
      elsif node.left.nil?
        if node.parent.left == node
          node.parent.left = node.right
        else
          node.parent.right = node.right
        end
        node.right.parent = node.parent
      else
        if node.parent.left == node
          node.parent.left = node.left
        else
          node.parent.right = node.left
        end
        node.left.parent = node.parent
      end
    end
    return node
  end

  def remove(data)
    node = find_node(data, root)
    remove_node(node)
  end

  def level_order_traversal
    levels = []
    levels << [self.root]
    while !levels.empty?
      level = levels.pop
      new_level = []
      level.each do |node|
        print "(DATA: #{node.data}, LEFT: #{node.left.nil? ? 'nil' : node.left.data}, RIGHT: #{node.right.nil? ? 'nil' : node.right.data}, PARENT:  #{node.parent.nil? ? 'nil' : node.parent.data}) "
        unless node.left.nil?
          new_level << node.left
        end
        unless node.right.nil?
          new_level << node.right
        end
      end
      puts ""
      unless new_level.empty?
        levels << new_level
      end
    end
  end
end

bst = BinarySearchTree.new(44)
bst.insert(17)
bst.insert(32)
bst.insert(28)
bst.insert(29)
bst.insert(88)
bst.insert(97)
bst.insert(65)
bst.insert(54)
bst.insert(82)
bst.insert(76)
bst.insert(80)
bst.insert(78)

bst.remove(32)
bst.remove(65)
bst.level_order_traversal