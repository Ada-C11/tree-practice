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

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
      return
    end

    add_helper(@root, new_node)
  end

  def add_helper(tree_node, new_node)
    if tree_node.nil?
      tree_node = new_node
    end

    return tree_node if tree_node.key == new_node.key

    if new_node.key < tree_node.key
      if tree_node.left.nil?
        tree_node.left = new_node
      else
        add_helper(tree_node.left, new_node)
      end
    end

    if new_node.key > tree_node.key
      if tree_node.right.nil?
        tree_node.right = new_node
      else
        add_helper(tree_node.right, new_node)
      end
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?
    return find_helper(@root, key)
  end

  def find_helper(tree_node, key)
    return nil if tree_node.nil?
    return tree_node.value if tree_node.key == key
    return find_helper(tree_node.left, key) if key < tree_node.key
    return find_helper(tree_node.right, key)
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) where n is the number of nodes
  def inorder
    return [] if @root.nil?
    return inorder_helper(@root)
  end

  def inorder_helper(tree_node, array = [])
    return array if tree_node.nil?
    if tree_node
      inorder_helper(tree_node.left, array)
      array << {key: tree_node.key, value: tree_node.value}
      inorder_helper(tree_node.right, array)
    end
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) where n is the number of nodes
  def preorder
    return [] if @root.nil?
    return preorder_helper(@root)
  end

  def preorder_helper(root)
    return if root.nil?
    array = []
    array << root
    nodeStack = []

    while array.length > 0
      node = array.pop
      nodeStack << {key: node.key, value: node.value}
      if node.right != nil 
        array << node.right
      end

      if node.left != nil
        array << node.left
      end
    end
    return nodeStack
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) where n is the length of the tree
  def postorder
    return [] if @root.nil?
    return postorder_helper(@root)
  end

  def postorder_helper(tree_node, array = [])
    return array if tree_node.nil?

    if tree_node
      postorder_helper(tree_node.left, array)
      postorder_helper(tree_node.right, array)
      array << {key: tree_node.key, value: tree_node.value}
    end
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(1)
  def height
    return 0 if @root.nil?
    return height_helper(@root)
  end

  def height_helper(tree_node)
    return 0 if tree_node.nil?
    left_height = height_helper(tree_node.left)
    right_height = height_helper(tree_node.right)
    if left_height > right_height
      return left_height + 1
    else
      return right_height + 1
    end
  end

  # Optional Method
  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) where is is the length of the tree
  def bfs
    return [] if @root.nil?
    queue = []
    output = []
    queue << @root
    while (!queue.empty?)
      current = queue.shift
      if(current.left) then queue.push(current.left) end
      if(current.right) then queue.push(current.right) end
        output.push({key: current.key, value: current.value})
    end
    return output
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
