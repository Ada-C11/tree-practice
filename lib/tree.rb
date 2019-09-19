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

  def add_helper(current, new_node)
    #p current.key
    if new_node.key <= current.key
      if current.left.nil?
        current.left = new_node
      else 
        add_helper(current.left, new_node)
      end
    else
      if current.right.nil?
        current.right = new_node
      else
        add_helper(current.right, new_node)
      end
    end
  end
  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    puts ""
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  # Time Complexity: O(logn)
  # Space Complexity: 
  def find_helper(current,key)
    return nil if current.nil?
    #p current.key
    if key == current.key
      return current.value
    end
    if key < current.key 
      return find_helper(current.left, key)
    end
    if key > current.key
      return find_helper(current.right, key)
    end
  end

  def find(key)
    return find_helper(@root,key)
  end

  # Time Complexity: 
  # Space Complexity: 
  # def inorder_traverse(node)
  #   if node == nil
  #     return
  #   else inorder_traverse(node.left)
  #     return node.value
      
  # end
  def inorder(node)
    if node == nil
      return
    else 
      inorder(node.left)
      print "#{node.key} "
      inorder(node.right)
    end 
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
tree.add(27,"abbie")
tree.inorder(tree.root)
tree.add(50,"barney")
tree.inorder(tree.root)
tree.add(45,"cat")
tree.inorder(tree.root)
tree.add(3,"dog")

tree.inorder(tree.root)

# puts tree.find(45)

# puts tree.find(27)
# puts tree.find(50)
# puts tree.find(45)
# puts tree.find(3)
# puts tree.find(-1)
# puts tree.find(10)
# puts tree.root.right.value