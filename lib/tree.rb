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

  # Time Complexity: O(log n) - omit half of dataset to add a value if tree is balanced
  # Space Complexity: O(1) to insert a node
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

  # Time Complexity: Ologn - omit half of dataset (if balanced) to find a value
  # Space Complexity: O(1) Constant
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

  # Time Complexity: O(n) because we visit each node once
  # Space Complexity: O(h) where h is equal to height of tree unless tree is imbalanced, then O(n)
  def inorder
    root_node = @root
    array = []
    return bst_inorder(root_node, array)
  end

  def bst_inorder(node, arr)
    if node
      bst_inorder(node.left, arr) if node.left
      arr << {:key => node.key, :value => node.value}
      bst_inorder(node.right, arr) if node.right
    end
    return arr
  end



  # Time Complexity: O(n) because we visit each node once
  # Space Complexity: O(h) where h is equal to height of tree unless tree is imbalanced, then O(n)
  def preorder
    array = []
    root_node = @root
    return bst_preorder(root_node, array)
  end

  def bst_preorder(node, arr)
    if !node
      arr << {:key => node.key, :value => node.value}
      bst_preorder(node.left, arr) if node.left
      bst_preorder(node.right, arr) if node.right
    end

    return arr
  end

  # Time Complexity: O(n) because we visit each node once
  # Space Complexity: O(h) where h is equal to height of tree unless tree is imbalanced, then O(n)
  def postorder
    array = []
    root_node = @root
    return bst_postorder(root_node, array)
  end

  def bst_postorder(node, arr)
    if node
      bst_postorder(node.left, arr) if node.left
      bst_postorder(node.right, arr) if node.right
      arr << {:key => node.key, :value => node.value}
    end
    return arr 
  end

  # Time Complexity: O(n) because you have to check each node/subtree in the tree to determine height
  # Space Complexity: O(logn) unless unbalanced, then O(n)
  def height
    current = @root
    return 0 if @root.nil?

    return tree_height(current)
  
  end

  def tree_height(node)
    #find the height of the largest subtree + root node
    height_left = 0
    height_right = 0

    if node == nil
      return 0
    else
      height_left = tree_height(node.left) if node.left
      height_right = tree_height(node.right) if node.right
      height_left > height_right ? 1 + height_left : 1 + height_right
    end
  end

  # Optional Method
  # Time Complexity: O(n) because we visit every node
  # Space Complexity: O(n) because I am storing all bfs nodes in an array
  def bfs
    node = @root
    array = []
    return breadth_first(node, array)
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
    puts "#{self.inorder}"
  end
end
