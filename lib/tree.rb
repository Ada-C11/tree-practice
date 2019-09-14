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

  # Time Complexity: O(log n) for balanced trees, O(n) for unbalanced trees.
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root == nil
      @root = new_node
    else
      current = @root 
      add_helper(current, new_node)
    end
  end

  def add_helper(current, new_node)
    if current == nil 
      return current = new_node
    elsif new_node.key < current.key
      current.left = add_helper(current.left, new_node)
    else 
      current.right = add_helper(current.right, new_node)
    end
    return current 
  end

  # Time Complexity: O(log n) for balanced trees, O(n) for unbalanced trees.
  # Space Complexity: O(1)
  def find(key)
    return nil if @root == nil

    current = @root
    find_helper(current, key)
  end

  def find_helper(current, key)
    if current.key == key 
      return current.value 
    elsif key < current.key
      current.left = find_helper(current.left, key)
    else
      current.right = find_helper(current.right, key)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    array = []
    return array if @root == nil
    current = @root

    return inorder_helper(current, array)
  end

  def inorder_helper(current, array)
    if current == nil
       return array
    else
      inorder_helper(current.left, array)
      array.push({:key => current.key, :value => current.value})
      inorder_helper(current.right, array)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    array = []
    return array if @root == nil
    current = @root

    return preorder_helper(current, array)
  end

  def preorder_helper(current, array)
    if current == nil
      return array
    else
      array.push({:key => current.key, :value => current.value})
      preorder_helper(current.left, array)
      preorder_helper(current.right, array)
    end 
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    array = []
    return array if @root == nil
    current = @root

    return postorder_helper(current, array)
  end

  def postorder_helper(current, array)
    if current == nil
      return array
    else
      postorder_helper(current.left, array)
      postorder_helper(current.right, array)
      array.push({:key => current.key, :value => current.value})
    end 
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def height
    return 0 if @root == nil
    current = @root 
    height_helper(current)
  end

  def height_helper(current)
    return 0 if current == nil
    left_side = height_helper(current.left)
    right_side = height_helper(current.right)

    if left_side < right_side
      return (right_side + 1)
    else
      return (left_side + 1)
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
