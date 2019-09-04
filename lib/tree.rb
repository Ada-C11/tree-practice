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
  def add(key, value)
    new_node = TreeNode.new(key, value)
    if !@root 
      @root = new_node
      return 
    end
    add_node(new_node, @root)

  end
  
  def add_node(new_node, curr)
    if curr.key >= new_node.key
      if !curr.left 
        curr.left = new_node
        return
      end
      add_node(new_node, curr.left)
    else
      if !curr.right
        curr.right = new_node
        return
      end
      add_node(new_node, curr.right)
    end
  end


  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return if !@root
    curr = @root
    while curr 
      if curr.key == key
        return curr.value
      elsif curr.key > key
        curr = curr.left
      else
        curr = curr.right
      end
    end
    return false
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    inorder_traversal(@root, [])
  end

  def inorder_traversal(node, node_array)
    return node_array if !node
    inorder_traversal(node.left, node_array)
    visit(node, node_array)
    inorder_traversal(node.right, node_array)
  end

  def visit(node, arr)
    arr.push({key: node.key, value: node.value})
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    preorder_traversal(@root, [])
  end

  def preorder_traversal(node, node_array)
    return node_array if !node
    visit(node, node_array)
    preorder_traversal(node.left, node_array)
    preorder_traversal(node.right, node_array)
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    postorder_traversal(@root, [])
  end

  def postorder_traversal(node, node_array)
    return node_array if !node
    postorder_traversal(node.left, node_array)
    postorder_traversal(node.right, node_array)
    visit(node, node_array)
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    longest_tree_path(@root)
  end

  def longest_tree_path(node)
    return 0 if !node
    right = longest_tree_path(node.right)
    left = longest_tree_path(node.left)
    return [right, left].max + 1
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
