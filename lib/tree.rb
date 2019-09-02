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

  # Time Complexity: O(log n) if the tree is balanced, O(n) if the tree is unbalanced
  #                 - where n is equal to the number of TreeNodes in the tree
  # Space Complexity: O(1) - constant
  def add(key, value, current = @root)
    new_node = TreeNode.new(key, value)

    if @root
      if key <= current.key
        current.left ? add(key, value, current.left) : current.left = new_node
      else
        current.right ? add(key, value, current.right) : current.right = new_node
      end
    else
      @root = new_node
    end
  end

  # Time Complexity: O(log n) if the tree is balance, O(n) is the tree is unbalanced
  #                 - where n is equal to the number of TreeNodes in the tree
  # Space Complexity: O(1) - constant
  def find(key, current = @root)
    if current
      if current.key == key
        return current.value
      elsif key <= current.key
        find(key, current.left)
      elsif key > current.key
        find(key, current.right)
      end
    else
      return
    end
  end

  # Time Complexity: O(n) - where n is equal to the number of TreeNodes in the tree
  # Space Complexity: O(n) where n is equal to the number of TreeNodes in the tree
  def inorder(current = @root, array = [])
    if current
      inorder(current.left, array)
      array << { key: current.key, value: current.value }
      inorder(current.right, array)
    else
      return array
    end
  end

  # Time Complexity: O(n) - where n is equal to the number of TreeNodes in the tree
  # Space Complexity: O(n) where n is equal to the number of TreeNodes in the tree
  def preorder(current = @root, array = [])
    if current
      array << { key: current.key, value: current.value }
      preorder(current.left, array)
      preorder(current.right, array)
    else
      return array
    end
  end

  # Time Complexity: O(n) - where n is equal to the number of TreeNodes in the tree
  # Space Complexity: O(n) where n is equal to the number of TreeNodes in the tree
  def postorder(current = @root, array = [])
    if current
      postorder(current.left, array)
      postorder(current.right, array)
      array << { key: current.key, value: current.value }
    else
      return array
    end
  end

  # Time Complexity: O(n) - where n is equal to the number of TreeNodes in the tree
  # Space Complexity: O(1) - constant
  def height(current = @root)
    if current
      left_height = height(current.left)
      right_height = height(current.right)

      return (left_height > right_height ? left_height : right_height) + 1
    else
      return 0
    end
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
