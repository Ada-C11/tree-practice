class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end

  def add(key, value)
    if key == @key
      return
    elsif key < @key
      left.nil? ? @left = TreeNode.new(key, value) : left.add(key, value)
    elsif key > @key
      right.nil? ? @right = TreeNode.new(key, value) : right.add(key, value)
    end
  end

  def find(key)
    if key == @key
      return @value
    elsif key < @key
      left.nil? ? nil : left.find(key)
    elsif key > @key
      right.nil? ? nil : right.find(key)
    end
  end

  def inorder(array)
    left.inorder(array) unless left.nil?
    array << {key: @key, value: @value}
    right.inorder(array) unless right.nil?
  end

  def preorder(array)
    array << {key: @key, value: @value}

    if left
      left.preorder(array)
    end

    if right
      right.preorder(array)
    end
  end

  def postorder(array)
    if left
      left.postorder(array)
    end

    if right
      right.postorder(array)
    end
    array << {key: @key, value: @value}
  end
end

class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  # Time Complexity: O(log n) if balanced tree, O(n) if unbalanced, n = # nodes in tree
  # Space Complexity: O(log n) if balanced tree, O(n) if unbalanced, n = # nodes in tree
  def add(key, value)
    if root.nil?
      @root = TreeNode.new(key, value)
    else
      root.add(key, value)
    end
  end

  # Time Complexity: O(log n) if balanced tree, O(n) if unbalanced, n = # nodes in tree
  # Space Complexity: O(log n) if balanced tree, O(n) if unbalanced, n = # nodes in tree
  def find(key)
    if root.nil?
      return nil
    else
      root.find(key)
    end
  end

  # Time Complexity: O(n),n = # nodes in tree
  # Space Complexity: O(n), n = # nodes in tree
  def inorder
    array = []
    if root.nil?
      return array
    else
      root.inorder(array)
      return array
    end
  end

  # Time Complexity: O(n), n = # nodes in tree
  # Space Complexity: O(n), n = # nodes in tree
  def preorder
    array = []
    if root.nil?
      return array
    else
      root.preorder(array)
      return array
    end
  end

  # Time Complexity: O(n), n = # nodes in tree
  # Space Complexity: O(n), n = # nodes in tree
  def postorder
    array = []
    if root.nil?
      return array
    else
      root.postorder(array)
      return array
    end
  end

  # Time Complexity: O(n), n = # nodes in tree
  # Space Complexity: O(1)
  def height(current = @root)
    if current
      lh = height(current.left)
      rh = height(current.right)

      (lh > rh ? lh : rh) + 1
    else
      0
    end
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
