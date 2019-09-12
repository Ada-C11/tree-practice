# bst allow efficient store + update  a sorted, changing dataset
# trees are nonlinear data structures made of nodes that hold data
# nodes connected by edges that define a parent + child relationship
# first node = root node (zero or more child nodes) + is parent node of left & right children
# each node has 0 or 2 children
# filled from left to right
# can have multiple subtrees
# leaf nodes = nodes w/ 0 children

 

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

  # add a value to
  def add(node, value)
    if node.value == value
      return node
    elsif value < node.value
      insert(node.left, value)
    elsif value > node.value
      insert(node.right, value)
    else
      return node = Node.new(value)
    end
  end

  # Time Complexity:
  # Space Complexity:

  # find a given node

  def find(key)
    raise NotImplementedError
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