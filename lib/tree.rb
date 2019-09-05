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

  # Time Complexity: O(log(n)) where n is the number of nodes
  # Space Complexity: O(1)
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


  # Time Complexity: O(log(n)) where n is the number of nodes
  # Space Complexity: O(1)
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

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) ""
  def inorder
    inorder_traversal(@root, [])
  end

  def inorder_traversal(node, node_list)
    return node_list if !node
    inorder_traversal(node.left, node_list)
    visit(node, node_list)
    inorder_traversal(node.right, node_list)
  end

  def visit(node, arr)
    arr.push({key: node.key, value: node.value})
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) ""
  def preorder
    preorder_traversal(@root, [])
  end

  def preorder_traversal(node, node_list)
    return node_list if !node
    visit(node, node_list)
    preorder_traversal(node.left, node_list)
    preorder_traversal(node.right, node_list)
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) "" 
  def postorder
    postorder_traversal(@root, [])
  end

  def postorder_traversal(node, node_list)
    return node_list if !node
    postorder_traversal(node.left, node_list)
    postorder_traversal(node.right, node_list)
    visit(node, node_list)
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n)
  def height
    longest_tree_path(@root)
  end

  def longest_tree_path(node)
    return 0 if !node
    right = longest_tree_path(node.right)
    left = longest_tree_path(node.left)
    return [right, left].max + 1
  end

  # Time Complexity: O(n) where n is the number of nodes
  # Space Complexity: O(n) ""
  def bfs
    bfs_queue = []
    curr = @root
    node_list = []
    while curr
      visit(curr, node_list)
      bfs_queue << curr.left if curr.left
      bfs_queue << curr.right if curr.right
      curr = bfs_queue.shift
    end
    return node_list
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
