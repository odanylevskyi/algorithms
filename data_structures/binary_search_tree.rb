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

  def find(data)
    find_node(data, root)
  end

  def find_max_node(node)
    if node.right.nil? && node.left.nil?
      return node
    end
    if !node.right.nil?
      return find_max_node(node.right)
    end
    if !node.left.nil?
      return find_max_node(node.left)
    end
  end

  def find_min_node(node)
    if node.right.nil? && node.left.nil?
      return node
    end
    if !node.left.nil?
      return find_min_node(node.left)
    end
    if !node.right.nil?
      return find_min_node(node.right)
    end
  end

  def remove_leaf(node)
    if node.parent.left == node
      node.parent.left = nil
    else
      node.parent.right = nil
    end
  end

  def replace_leaf(a, b)
    unless a.parent.nil?
      if a.parent.left == a
        a.parent.left = b
      else
        a.parent.right = b
      end
      b.parent = a.parent
      b.left = a.left
      if !b.left.nil?
        b.left.parent = b
      end
      b.right = a.right
      if !b.right.nil?
        b.right.parent = b
      end
    else
      b.parent = nil
      b.left = a.left
      b.right = a.right
      self.root = b
    end
  end

  def remove_node(data, node)
    node = find_node(data, root)
    unless node.nil?
      if node.parent.nil? && node.left.nil? && node.right.nil?
        self.root = nil
      elsif node.left.nil? && node.right.nil?
        remove_leaf(node)
      elsif !node.left.nil?
        left_max_node = find_max_node(node.left)
        remove_leaf(left_max_node)
        replace_leaf(node, left_max_node)
      else
        right_min_node = find_min_node(node.right)
        remove_leaf(right_min_node)
        replace_leaf(node, right_min_node)
      end
    end
    return node
  end

  def remove(data)
    remove_node(data, root)
  end

  def level_order_traversal
    levels = []
    levels << [self.root]
    while !levels.empty?
      level = levels.pop
      new_level = []
      puts level.collect(&:data).to_s
      level.each do |node|
        unless node.left.nil?
          new_level << node.left
        end
        unless node.right.nil?
          new_level << node.right
        end
      end
      unless new_level.empty?
        levels << new_level
      end
    end
  end
end

bst = BinarySearchTree.new(5)
bst.insert(15)
bst.insert(11)
bst.insert(12)
bst.insert(13)
bst.insert(17)

# puts bst.remove(15).to_s
# puts bst.remove(13).to_s
# bst.remove(5)
bst.level_order_traversal