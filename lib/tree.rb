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

  # Time Complexity: O(log n) if the tree is balanced, where n is the number of nodes in the tree.
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    current = @root

    if current == nil
      @root = new_node
    elsif new_node.key <= current.key
      if current.left == nil
        current.left = new_node
      else
        return self.add(key, value)
      end
    else
      if current.right == nil
          current.right = new_node
      else
        return self.add(key, value)
      end
    end
  end

  # Time Complexity: O(log n) if the tree is balanced, where n is the number of nodes in the tree.
  # Space Complexity: O(1)
  def find(key)
    current = @root

    if current == nil
      return nil
    end

    while current != nil
      if key == current.key
        return current.value
      elsif key <= current.key
        current = current.left
      else
        current = current.right
      end
    end
  end

  # Time Complexity:
  # Space Complexity:
  # left root right
  def inorder
    current = @root
    tree_nodes = []

    # get current to farthest left node
    until current.left == nil 
      current = current.left
    end

    tree_nodes << current
    
    current = current.right 

    tree_nodes << current 

    current = current.right 

    tree_nodes << current 
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
    tree_height = 0
    current = @root 

    if current == nil 
      return tree_height
    end

    if current.left == nil && current.right == nil 

    return tree_height
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
