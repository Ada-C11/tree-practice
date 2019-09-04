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

  # Time Complexity: O(n) (O(logn) if tree is balanced), where n is the height of the tree
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if @root ==  nil
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  # Time Complexity: O(n) (O(logn) if tree is balanced), where n is the height of the tree
  # Space Complexity: O(1)
  def find(key)
    return nil if @root == nil

    current = @root

    until current == nil
      if key == current.key
        return current.value
      elsif key < current.key
        current = current.left
      else
        current = current.right
      end
    end

    return nil
  end

  # Time Complexity: O(n), where n is the number of nodes
  # Space Complexity: O(n), where n is the number of nodes
  def inorder
    return [] if @root == nil

    current = @root 
    tree = []
      
    return inorder_helper(current, tree)
  end

  # Time Complexity: O(n), where n is the number of nodes
  # Space Complexity: O(n), where n is the number of nodes
  def preorder
    return [] if @root == nil

    current = @root 
    tree = []
      
    return preorder_helper(current, tree)
  end

  # Time Complexity: O(n), where n is the number of nodes
  # Space Complexity: O(n), where n is the number of nodes
  def postorder
    return [] if @root == nil

    current = @root 
    tree = []
      
    return postorder_helper(current, tree)
  end

  # Time Complexity: O(n), where n is the number of nodes
  # Space Complexity: O(1)
  def height
    return 0 if @root == nil

    current = @root

    return height_helper(current, 1, 1)
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

  private

  def add_helper(current, new_node)
    return new_node if current == nil

    if current.key >= new_node.key
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end

    return current
  end

  def inorder_helper(current, tree)
    return tree if current == nil

    inorder_helper(current.left, tree)
    tree.push({ :key => current.key, :value => current.value })
    inorder_helper(current.right, tree)

  end

  def preorder_helper(current, tree)
    return tree if current == nil
    
    tree.push({ :key => current.key, :value => current.value })
    
    preorder_helper(current.left, tree)
    preorder_helper(current.right, tree)
  end

  def postorder_helper(current, tree)
    return tree if current == nil
    
    postorder_helper(current.left, tree)
    postorder_helper(current.right, tree)

    tree.push({ :key => current.key, :value => current.value })
  end

  def height_helper(current, current_height, max_height)
    return max_height if current == nil

    max_height = current_height if current_height > max_height

    max_height = height_helper(current.left, current_height + 1, max_height)
    max_height = height_helper(current.right, current_height +1, max_height)

    return max_height
  end
end
