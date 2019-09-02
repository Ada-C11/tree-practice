class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  # Time Complexity: O(log n) on balanced trees, O(n) on unbalanced
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  def add_helper(current, new_node)
    return new_node if current.nil?
    if current.nil?
      return current = new_node
    elsif new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end

    return current
  end

  # Time Complexity: O(log n) on balanced trees, O(n) on unbalanced
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?
    find_helper(@root, key)
  end

  def find_helper(current, key)
    return key if current.nil?
    if key == current.key
      return current.value
    elsif key < current.key
      find_helper(current.left, key)
    else
      find_helper(current.right, key)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    tree = []
    return tree if @root.nil?
    inorder_helper(@root, tree)
    return tree
  end

  def inorder_helper(current, tree)
    return if current.nil?
    inorder_helper(current.left, tree)
    tree << {:key => current.key, :value => current.value}
    inorder_helper(current.right, tree)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    tree = []
    return tree if @root.nil?
    preorder_helper(@root, tree)
    return tree
  end

  def preorder_helper(current, tree)
    return if current.nil?
    tree << {:key => current.key, :value => current.value}
    preorder_helper(current.left, tree)
    preorder_helper(current.right, tree)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    tree = []
    return tree if @root.nil?
    postorder_helper(@root, tree)
    return tree
  end

  def postorder_helper(current, tree)
    return if current.nil?
    postorder_helper(current.left, tree)
    postorder_helper(current.right, tree)
    tree << {:key => current.key, :value => current.value}
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    height_helper(@root)
  end

  def height_helper(current)
    return 0 if current.nil?
    left = height_helper(current.left)
    right = height_helper(current.right)
    (left > right) ? (left + 1) : (right + 1)
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
    tree = []
    return tree if @root.nil?
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
