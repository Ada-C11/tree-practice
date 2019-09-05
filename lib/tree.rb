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

  # Time Complexity: O(log n) - traverse only half of dataset
  # Space Complexity: O - just adding a node
  def add(key, value)
    if key.nil? || value.nil?
      return nil
    end

    if @root.nil?
      @root = TreeNode.new(key, value)
      return
    end

    insert_node = TreeNode.new(key, value)
    current_root = @root

    while !current_root.nil?
      trailing_node = current_root

      if key <= current_root.key
        current_root = current_root.left
      else 
        current_root = current_root.right
      end
    end

    if key <= trailing_node.key
      trailing_node.left = insert_node
    else
      trailing_node.right = insert_node
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    #begin with root node, returns value
    return unless !@root.nil?

    current_node = @root

    while current_node != nil
      if key == current_node.key
       return current_node.value
      elsif key <= current_node.key
        current_node = current_node.left
      else 
        current_node = current_node.right
      end
    end

    return nil
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    root_node = @root
    array = []
    inorder_array = bst_inorder(root_node, array)
  end

  def bst_inorder(node, arr)
    return arr if !node
    bst_inorder(node.left, arr)
    arr << {:key => node.key, :value => node.value}
    bst_inorder(node.right, arr)
  end



  # Time Complexity: 
  # Space Complexity: 
  def preorder
    array = []
    root_node = @root
    preorder_arr = bst_preorder(root_node, array)
  end

  def bst_preorder(node, arr)
    return arr if !node
    arr << {:key => node.key, :value => node.value}
    bst_preorder(node.left, arr)
    bst_preorder(node.right, arr)
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    array = []
    root_node = @root
    postorder_arr = bst_postorder(root_node, array)
  end

  def bst_postorder(node, arr)
    return arr if !node
    bst_postorder(node.left, arr)
    bst_postorder(node.right, arr)
    arr << {:key => node.key, :value => node.value}
    
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    node = @root
    array = []
    bfs_arr = breadth_first(node, array)
  end

  def breadth_first(node, arr)
    current = node
    levels_list = []
    i = 0

    return arr if node.nil?
    # add level by level
    while i <= levels_list.length
      arr << {:key => current.key, :value => current.value} 
      levels_list << current.left if current.left
      levels_list << current.right if current.right
      current = levels_list[i]
      i+= 1
    end
    return arr
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
