class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end

  def inorder(array)
    #left, root, right
    if @left != nil
      @left.inorder(array)
    end

    array << {key: @key, value: @value}

    if @right != nil
      @right.inorder(array)
    end
  end

  def preorder(array)
    #Root, Left, Right
    array << {key: @key, value: @value}

    if @left != nil
      @left.preorder(array)
    end

    if @right != nil
      @right.preorder(array)
    end
  end

  def postorder(array)
    #left, right, root

    if @left != nil
      @left.postorder(array)
    end

    if @right != nil
      @right.postorder(array)
    end

    array << {key: @key, value: @value}
  end
end

class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  # Time Complexity: O(logn) if it is balanced, O(n) if it is not
  # Space Complexity: Constant
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root == nil
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  def add_helper(current, new_node)
    if current == nil
      return current = new_node
    end

    if new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end
    return current
  end

  # Time Complexity: O(logn) if it is balanced, O(n) if it is not balanced
  # Space Complexity: constant
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

  # Time Complexity: O(n) - need to visit each node in the tree
  # Space Complexity:
  def inorder
    list = []
    if @root != nil
      @root.inorder(list)
    end
    return list
  end

  # Time Complexity:
  # Space Complexity:
  def preorder
    #Root, Left, Right
    list = []

    if @root == nil #done
      return []
    else
      @root.preorder(list)
    end
    return list
  end

  # Time Complexity:
  # Space Complexity:
  def postorder
    #left, right, root
    list = []

    if @root == nil
      return []
    else
      @root.postorder(list)
    end
  end

  # Time Complexity:
  # Space Complexity:
  def height(current = @root)
    return 0 if current == nil
    heightLeft = 0
    heightRight = 0

    if current.left != nil
      heightLeft = height(current.left)
    end

    if current.right != nil
      heightRight = height(current.right)
    end

    if heightLeft < heightRight
      return heightRight + 1
    else
      return heightLeft + 1
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
