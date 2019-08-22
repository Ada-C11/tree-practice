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
    new_tree_node = TreeNode.new(key, value)

    # if @root.nil?
      @root = new_tree_node
    # else
    #   current = @root

    #   while !current.left.value.nil? || !current.right.value.nil?

    #   end
    # end 
  end

  # Time Complexity:
  # Space Complexity:
  def find(key)
    return nil if @root.nil?

    current = @root
    until current.key == key
      if key > current.key
        current = current.right
      else 
        current = current.left
      end 
    end 

    return current.value
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
