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

  # Time Complexity: O(logn) because one side of the tree can be eliminated each time the new key is evaluated against the existing nodes data
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)
    @root = new_node if @root.nil?
    current = @root
    add_helper(current, new_node)
  end

  def add_helper(current, new_node)
    if current.nil?
      return current = new_node
    elsif new_node.key < current.key
      current.left = add_helper(current.left, new_node)
    elsif new_node.key > current.key
      current.right = add_helper(current.right, new_node)
    end
    return current
  end

  # Time Complexity: O(logn) because one side of the tree can be eliminated each time the new key is evaluated against the existing nodes data
  # Space Complexity: O(1)
  def find(key)
    current = @root
    return nil if current.nil?
    return current.value if current.key == key
    find_helper(current, key)
  end

  def find_helper(current, key)
    if key == current.key
      return current.value
    elsif key < current.key
      current.left = find_helper(current.left, key)
    else
      current.right = find_helper(current.right, key)
    end
  end

  # Time Complexity: O(n) because each node will need to be visited and added to the final array
  # Space Complexity: O(n) because the final array will contain the size of the tree
  # left, root, right
  def inorder
    array = []
    return array if @root.nil?
    inorder_helper(array, @root)
    return array
  end

  def inorder_helper(array, node)
    return if node.nil?
    inorder_helper(array, node.left)
    hash = { key: node.key, value: node.value }
    array.push(hash)
    inorder_helper(array, node.right)
  end

  # Time Complexity: O(n) because each node will need to be visited and added to the final array
  # Space Complexity: O(n) because the final array will contain the size of the tree
  # root, left, right
  def preorder
    return [] if @root.nil?
    array = []
    preorder_helper(@root, array)
    return array
  end

  def preorder_helper(node, array)
    return if node.nil?
    array.push({ key: node.key, value: node.value })
    preorder_helper(node.left, array)
    preorder_helper(node.right, array)
  end

  # Time Complexity: O(n) because each node will need to be visited and added to the final array
  # Space Complexity: O(n) because the final array will contain the size of the tree
  # left, right, root
  def postorder
    array = []
    return array if @root.nil?
    postorder_helper(array, @root)
    return array
  end

  def postorder_helper(array, node)
    return if node.nil?
    postorder_helper(array, node.left)
    postorder_helper(array, node.right)
    # hash = { key: node.key, value: node.value }
    array.push({ key: node.key, value: node.value })
  end

  # Time Complexity: O(n) because worst case each node will need to be visited to be counted
  # Space Complexity: O(1)
  def height
    return 0 if @root.nil?
    node = @root
    return height_helper(@root)
  end

  def height_helper(node)
    return 0 if node.nil?
    left = height_helper(node.left)
    right = height_helper(node.right)

    if left >= right
      return left + 1
    else
      return right + 1
    end
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
    array = []
    return array if @root.nil?
  end

  def bfs_helper(node, level, array)
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
