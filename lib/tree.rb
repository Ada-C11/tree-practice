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

  # Time Complexity:
  # Space Complexity:
  def add(key, value)
    if !@root
      new_node = TreeNode.new(key, value)
      @root = new_node
      return
    end

    current = @root
    new_node = TreeNode.new(key, value)
    new_node.key <= current.key ? current.left = new_node : current.right = new_node
    
  end

  # Time Complexity: 
  # Space Complexity:
  def find(key)
    return nil if !@root
    current = @root

    until current == nil
      return current.value if key == current.key
      key < current.key ? current = current.left : current = current.right
    end

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
