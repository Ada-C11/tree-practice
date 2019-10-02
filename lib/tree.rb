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

  # Time Complexity: O(log n) 
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root ==  nil
      @root = new_node
    else
      add_node(@root, new_node)
    end
  end

  def add_node(root, new_node)
    if new_node.key < root.key
      return root.left = new_node unless root.left
      add_node(root.left, new_node)
    elsif new_node.key > root.key
      return root.right = new_node unless root.right
      add_node(root.right, new_node)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find(key)
    return nil if @root == nil

    current = @root

    until current == nil
      if key == current.key
        return current.value
      elsif key < current.key
        current = current.left
      else
        current = current.right
      end
    end

    return nil
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    return [] if @root == nil

    current = @root 
    tree = []
      
    return inorder_helper(current, tree)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    return [] if @root == nil

    current = @root 
    tree = []
      
    return preorder_helper(current, tree)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    return [] if @root == nil

    current = @root 
    array = []
      
    return postorder_helper(current, array)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def height
    return 0 if @root == nil

    current = @root

    return height_helper(current, 1, 1)
  end

  def height_helper(node)
    return 0 unless node
    left_counter = height_helper(node.left)
    right_counter = height_helper(node.right)
    counter = left_counter > right_counter ? left_counter : right_counter
    return counter += 1
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
