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

  # Time Complexity: O(n) is worst case if tree is not balanced where n is the height of the tree
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root == nil
      @root = new_node
      return
    end

    current = @root

    while current != nil
      if current.key >= key
        break if current.left == nil
        current = current.left
      else
        break if current.right == nil
        current = current.right
      end
    end

    current.key >= key ? current.left = new_node : current.right = new_node
  end

  # Time Complexity: O(n) is worst case if tree is not balanced where n is the height of the tree
  # Space Complexity: O(1)
  def find(key)
    current = @root

    while current != nil
      if current.key > key
        current = current.left
      elsif current.key < key
        current = current.right
      else
        return current.value
      end
    end
    return nil
  end

  # Time Complexity: O(n) where n is the number of nodes in the tree
  # Space Complexity: O(n) where n is the number of nodes in the tree
  def inorder
    return inorder_recursion(current = @root, tree = [])
  end

  def inorder_recursion(current, tree)
    if current != nil
      inorder_recursion(current.left, tree)
      tree << { key: current.key, value: current.value }
      inorder_recursion(current.right, tree)
    else
      return tree
    end
  end

  # Time Complexity: O(n) where n is the number of nodes in the tree
  # Space Complexity: O(n) where n is the number of nodes in the tree
  def preorder
    return preorder_recursion(current = @root, tree = [])
  end

  def preorder_recursion(current, tree)
    if current != nil
      tree << { key: current.key, value: current.value }
      preorder_recursion(current.left, tree)
      preorder_recursion(current.right, tree)
    else
      return tree
    end
  end

  # Time Complexity: O(n) where n is the number of nodes in the tree
  # Space Complexity: O(n) where n is the number of nodes in the tree xs4
  def postorder
    return postorder_recursion(current = @root, tree = [])
  end

  def postorder_recursion(current, tree)
    if current != nil
      postorder_recursion(current.left, tree)
      postorder_recursion(current.right, tree)
      tree << { key: current.key, value: current.value }
    else
      return tree
    end
  end

  # Time Complexity: O(n) where n is the number of nodes in the tree
  # Space Complexity: O(1)
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
