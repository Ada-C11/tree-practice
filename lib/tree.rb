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
  def add(key, value, current = @root)
    new_node = TreeNode.new(key, value)

    if !@root
      @root = new_node
    else
      if key <= current.key
        if !current.left
          current.left = new_node
        else
          add(key, value, current.left)
        end
      else
        if !current.right
          current.right = new_node
        else
          add(key, value, current.right)
        end
      end
    end
  end

  # Time Complexity:
  # Space Complexity:
  def find(key, current = @root)
    if !@root
      return nil
    elsif current.key == key
      return current.value
    elsif key <= current.key
      find(key, current.left)
    else
      find(key, current.right)
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
