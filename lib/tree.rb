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

  # Time Complexity: O(log n) must divide and conquer based on if new key is > || <
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root.nil?
      return @root = new_node
    end

    current = @root
    add_helper(current, new_node)

  end

  def add_helper(root, add_node)
    if root.nil?
      return add_node
    elsif add_node.key < root.key
      root.left = add_helper(root.left, add_node)
    elsif add_node.key > root.key
      root.right = add_helper(root.right, add_node)
    end
    return root
  end

  # Time Complexity: O(log n) - a divide and conquer algorithm
  # Space Complexity: O(1)

  def find(key)
    if @root.nil?
      return nil
    end

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
    tree_inorder = []

    if @root.nil?
      return tree_inorder
    end

    current = @root
    inorder_helper(current.left, tree_inorder)
    tree_inorder << {:key => current.key, :value => current.value}
    inorder_helper(current.right, tree_inorder)

    return tree_inorder
  end

  def inorder_helper(current_node, tree_array)
    tree_hash = {}
    if current_node.nil?
      return
    end

    inorder_helper(current_node.left, tree_array)
    tree_hash[:key] = current_node.key
    tree_hash[:value] = current_node.value
    tree_array << tree_hash
    inorder_helper(current_node.right, tree_array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    tree_inorder = []
    if @root.nil?
      return tree_inorder
    end

    current = @root
    tree_inorder << {:key => current.key, :value => current.value}
    preorder_helper(current.left, tree_inorder)
    preorder_helper(current.right, tree_inorder)

    return tree_inorder
  end

  def preorder_helper(current_node, tree_array)
    tree_hash = {}
    if current_node.nil?
      return
    end

    tree_hash[:key] = current_node.key
    tree_hash[:value] = current_node.value
    tree_array << tree_hash
    preorder_helper(current_node.left, tree_array)
    preorder_helper(current_node.right, tree_array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    tree_postorder = []
    if @root.nil?
      return tree_postorder
    end

    current = @root
    postorder_helper(current.left, tree_postorder)
    postorder_helper(current.right, tree_postorder)
    tree_postorder << {:key => current.key, :value => current.value}

    return tree_postorder
  end

  def postorder_helper(current_node, tree_array)
    tree_hash = {}
    if current_node.nil?
      return
    end

    postorder_helper(current_node.left, tree_array)
    postorder_helper(current_node.right, tree_array)
    tree_hash[:key] = current_node.key
    tree_hash[:value] = current_node.value
    tree_array << tree_hash
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def height
    if @root.nil?
      return 0
    end

    current = @root

    height_helper(current)
  end

  def height_helper(current_node)
    if current_node.nil?
      return 0
    end

    left_height = height_helper(current_node.left);
    right_height = height_helper(current_node.right);

    if (left_height > right_height)
      return (left_height + 1);
    else
      return (right_height + 1);
    end
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
