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

  def inorder(tree_array)
    # if !left.nil?
    if left
      left.inorder(tree_array)
    end

    tree_array << { key: @key, value: @value }

    # if !@right.nil?
    if right
      right.inorder(tree_array)
    end
  end

  def preorder(tree_array)
    tree_array << { key: @key, value: @value }

    if left
      left.preorder(tree_array)
    end

    if right
      right.preorder(tree_array)
    end
  end

  def postorder(tree_array)
    if left
      left.postorder(tree_array)
    end

    if right
      right.postorder(tree_array)
    end
    tree_array << { key: @key, value: @value }
  end

  def height(tree_height)
    # left_height = 0
    # right_heigt = 0
    # if !left.nil?
    #   left_height += 1
    #   # puts "!!!!!!!!!!!!!!  left: #{left_height}"
    #   left.height(left_height)
    # end

    # if !right.nil?
    #   right_height += 1
    #   # puts "!!!!!!!!!!!!!!  right: #{right_height}"
    #   right.height(right_height)
    # end

    # left_height >= right_height ? tree_height = left_height : tree_height = right_height
  end
end

class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  # Time Complexity: O(log n) if the tree is balanced, O(n) if it is unbalanced - where n is the number of nodes in the tree
  # Space Complexity: O(log n) if the tree is balanced, O(n) if it is unbalanced - where n is the number of nodes in the tree
  def add(key, value)
    # if root.nil?
    if !root
      @root = TreeNode.new(key, value)
    else
      root.add(key, value)
    end
  end

  # Time Complexity: O(log n) if the tree is balanced, O(n) if it is unbalanced - where n is the number of nodes in the tree
  # Space Complexity: O(log n) if the tree is balanced, O(n) if it is unbalanced - where n is the number of nodes in the tree
  def find(key)
    if root.nil?
      return nil
    else
      root.find(key)
    end
  end

  # Time Complexity: O(n), n is the number of nodes in the tree
  # Space Complexity: O(n), n is the number of nodes in the tree
  def inorder
    tree_array = []
    if root.nil?
      return tree_array
    else
      root.inorder(tree_array)
      return tree_array
    end
  end

  # Time Complexity: O(n), n is the number of nodes in the tree
  # Space Complexity: O(n), n is the number of nodes in the tree
  def preorder
    tree_array = []
    if root.nil?
      return tree_array
    else
      root.preorder(tree_array)
      return tree_array
    end
  end

  # Time Complexity: O(n), n is the number of nodes in the tree
  # Space Complexity: O(n), n is the number of nodes in the tree
  def postorder
    tree_array = []
    if root.nil?
      return tree_array
    else
      root.postorder(tree_array)
      return tree_array
    end
  end

  # Time Complexity:
  # Space Complexity:
  def height
    # tree_height = 0
    # if root.nil?
    #   return nil
    # else
    #   root.height(tree_height)
    #   return tree_height
    # end
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

tree = Tree.new
tree.add(5, "Peter")
tree.add(3, "Paul")
tree.add(1, "Mary")
tree.add(10, "Karla")
tree.add(15, "Ada")
tree.add(25, "Kari")

# puts tree.to_s

# puts tree.height
