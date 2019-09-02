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

  # Time Complexity: O(n) where n is the height of the tree
  #                   or O(log n) if the tree is balanced
  # Space Complexity: O(1)
  def add(key, value)
    new_tree_node = TreeNode.new(key, value)

    if @root.nil?
      @root = new_tree_node
    else
      current = @root
      while current
        if new_tree_node.key <= current.key
          if !current.left
            current.left = new_tree_node
            return
          else
            current = current.left
          end
        else
          if !current.right
            current.right = new_tree_node
            return
          else
            current = current.right
          end
        end
      end
    end
  end

  # Time Complexity: O(log n) if tree is balanced, n is size of tree
  #                   O(n) in worst case where n is also size of tree
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?

    current = @root
    while current
      if key > current.key
        current = current.right
      elsif key < current.key
        current = current.left
      else
        return current.value
      end
    end

    return nil
  end

  # Time Complexity:
  # Space Complexity:
  def inorder
    return [] if @root.nil?
  end

  # Time Complexity:
  # Space Complexity:
  def preorder
    return [] if @root.nil?
  end

  # Time Complexity:
  # Space Complexity:
  def postorder
    return [] if @root.nil?
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
