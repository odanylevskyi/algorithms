class AVLTree
  attr_accessor :root

  TreeNode = Struct.new(:data, :height, :parent, :left, :right)

  def initialize(data)
    @root = TreeNode.new(data, 0, nil, nil, nil)
  end

  def insert_node(data, node)
    if node.data > data
      if node.left.nil?
        node.left = TreeNode.new(data, 1, node)
      else
        insert_node(data, node.left)
      end
    else
      if node.right.nil?
        node.right = TreeNode.new(data, 1, node)
      else
        insert_node(data, node.right)
      end
    end
    node.height = get_height(node)
    rebalance(data, node)
  end

  def rebalance(data, node)
    if balance_factor(node) > 1
      if data < node.left.data
        left_rotation(node)
      elsif data >= node.left.data
        left_right_rotation(node)
      end
    elsif balance_factor(node) < -1
      if data >= node.right.data
        right_rotation(node)
      elsif data < node.right.data
        right_left_rotation(node)
      end
    end
  end

  def balance_factor(node)
    (node.left.nil? ? 0 : node.left.height) - (node.right.nil? ? 0 : node.right.height)
  end

  def insert(data)
    insert_node(data, root)
  end

  def get_height(node)
    [(node.left.nil? ? 0 : node.left.height), (node.right.nil? ? 0 : node.right.height)].max + 1
  end

  def left_rotation(node)
    left_child_right_subtree = nil
    unless node.left.nil?
      left_child_right_subtree = node.left.right
    end
    left_child = node.left
    node.left = left_child_right_subtree
    left_child.parent = node.parent
    if node.parent.nil?
      self.root = left_child
    else
      node.parent.left = left_child
    end
    node.parent = left_child
    left_child.right = node
    node.height = get_height(node)
    left_child.height = get_height(left_child)
    return left_child
  end

  def right_rotation(node)
    right_child_left_subtree = node.right.left
    right_child = node.right
    node.right = right_child_left_subtree
    right_child.parent = node.parent
    if node.parent.nil?
      self.root = right_child
    else
      node.parent.right = right_child
    end
    node.parent = right_child
    right_child.left = node
    node.height = get_height(node)
    right_child.height = get_height(right_child)
    return right_child
  end

  def left_right_rotation(node)
    left_child = node.left
    left_child.parent = nil
    left_child_right = left_child.right
    left_child.right = left_child_right.left
    left_child_right.left = left_child
    left_child_right.parent = node
    left_child.parent = left_child_right
    node.left = left_child_right
    left_child.height = get_height(left_child)
    left_child_right.height = get_height(left_child_right)
    return left_rotation(node)
  end

  def right_left_rotation(node)
    right_child = node.right
    right_child.parent = nil
    right_child_left = right_child.left
    right_child.left = right_child_left.right
    right_child_left.right = right_child
    right_child_left.parent = node
    right_child.parent = right_child_left
    node.right = right_child_left
    right_child.height = get_height(right_child)
    right_child_left.height = get_height(right_child_left)
    return right_rotation(node)
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

  def min_value(node)
    current = node
    while !current.left.nil?
      current = node.left
    end
    return current
  end

  def remove_leaf(node)
    if node.parent.left == node
      node.parent.left = nil
    else
      node.parent.right = nil
    end
  end

  def remove_node(data, node)
    if node.nil?
      return node
    end

    if data < node.data
      node.left = remove_node(data, node.left)
    elsif data > node.data
      node.right = remove_node(data, node.right)
    else
      if node.left.nil? || node.right.nil?
        tmp = node.left.nil? ? node.right : node.left
        if tmp.nil?
          remove_leaf(node)
        else
          return tmp
        end
        node = nil
      else
        tmp = min_value(node.right)
        node.data = tmp.data
        node.right = remove_node(tmp.data, node.right)
      end
    end

    if node.nil?
      return node
    end

    node.height = get_height(node)
    balance = balance_factor(node)

    if (balance > 1 && balance_factor(node.left) >= 0)
      return left_rotation(node);
    end
    if (balance > 1 && balance_factor(node.left) < 0)
      return left_right_rotation(node)
    end
    if (balance < -1 &&  balance_factor(node.right) <= 0)
      return right_rotation(node)
    end
    if (balance < -1 && balance_factor(node.right) > 0)
      return right_left_rotation(node)
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
      level.each do |node|
        print "(D: #{node.data}, H: #{node.height}, P:  #{node.parent.nil? ? 'nil' : node.parent.data}, L: #{node.left.nil? ? 'nil' : node.left.data}, R: #{node.right.nil? ? 'nil' : node.right.data}) "
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


avlTree = AVLTree.new(44)
avlTree.insert(17)
avlTree.insert(62)
avlTree.insert(32)
avlTree.insert(50)
avlTree.insert(78)
avlTree.insert(88)
avlTree.remove(17)
avlTree.level_order_traversal
