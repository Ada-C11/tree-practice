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

  # Time Complexity: O(log n) - traverse only half of dataset
  # Space Complexity: O - just adding a node
  def add(key, value)
    if @root.nil?
      new_tree_node = TreeNode.new(key, value)
      @root = new_tree_node
      return
    end

      current_node = @root
      add_node = TreeNode.new(key, value)
      if add_node.key <= current_node.key
        current_node.left = add_node
      else
        current_node.right = add_node
      end
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    #begin with root node, returns value
    return unless !@root.nil?

    current_node = @root

    while current_node != nil
      if key == current_node.key
       return current_node.value
      elsif key <= current_node.key
        current_node = current_node.left
      else 
        current_node = current_node.right
      end
    end

    return nil
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    raise NotImplementedError
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    raise NotImplementedError
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
