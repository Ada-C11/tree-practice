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

  # Time Complexity: O(log(n))
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root.nil?
      return @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  def add_helper(current, new_node)
    if current.nil?
      return new_node
    elsif new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end
    return current
  end

  # Time Complexity: O(log(n))
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?

    current = @root
    return find_helper(current, key)
  end

  def find_helper(root, key_to_find)
    if root.nil?
      return nil
    elsif root.key == key_to_find
      return root.value
    elsif key_to_find < root.key
      root.left = find_helper(root.left, key_to_find)
    elsif key_to_find > root.key
      root.right = find_helper(root.right, key_to_find)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    inorder_array = []
    current = @root

    return inorder_array if current.nil?

    return inorder_helper(current, inorder_array)
  end

  def inorder_helper(current, tree_array)
    return tree_array if current.nil?

    inorder_helper(current.left, tree_array)
    tree_array.push({ :key => current.key,
                     :value => current.value })
    inorder_helper(current.right, tree_array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    preorder_array = []
    current = @root

    return preorder_array if current.nil?

    return preorder_helper(current, preorder_array)
  end

  def preorder_helper(current, tree_array)
    return tree_array if current.nil?

    tree_array.push({ :key => current.key,
                     :value => current.value })
    preorder_helper(current.left, tree_array)
    preorder_helper(current.right, tree_array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    postorder_array = []
    current = @root

    return postorder_array if current.nil?

    return postorder_helper(current, postorder_array)
  end

  def postorder_helper(current, tree_array)
    return tree_array if current.nil?

    postorder_helper(current.left, tree_array)
    postorder_helper(current.right, tree_array)
    tree_array.push({ :key => current.key,
                     :value => current.value })
  end

  # Time Complexity: O(n)
  # Space Complexity:O(1)
  def height
    current = @root

    return 0 if current.nil?

     height_helper(current)
  end

  def height_helper(current)
    return 0 if current.nil?

    right = height_helper(current.right)
    left = height_helper(current.left)

    if right > left
      return right + 1
    else
      return left + 1
    end
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
    bfs_array = []
    current = @root
    return bfs_array if current.nil?
    
  # will come back to after queue exercises
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
