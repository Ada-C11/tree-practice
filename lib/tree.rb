class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
    @parent = nil
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
    raise NotImplementedError
  end

  # Time Complexity: O(n) / O(logn)
  # Space Complexity: O(1)
  def find(key)
    return find_helper(key, @root)
  end

  def find_helper(key, node)
    return nil unless node
    if key == node.key
        return node.value
    elsif key < node.key
        find_helper(key, node.left)
    else key > node.key
        find_helper(key, node.right)
    end 
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    array = []
    inorder_helper(array, @root)
  end

  def inorder_helper (array, node)
    return array unless node
      inorder_helper(array, node.left)
      node_kv = {}
      node_kv[:key] = node.key
      node_kv[:value] = node.value
      array.push(node_kv)
      inorder_heper(array, node.right)
  end 

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    array = []
    return preorder(array, @root)
  end

  def preorder_helper (array, node)
    return array unless node 
    node_kv = {}
    node_kv[:key] = node.key
    node_kv[:value] = node.value
    array.push(node_kv)
    preorder_helper(array, node.left)
    preorder_heper(array, node.right)
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
