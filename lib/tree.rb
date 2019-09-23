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
    puts ""
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  def add_helper(current, new_node)
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
  # Time Complexity: O(log n)
  # Space Complexity: O(1)
  def find_helper(current,key)
    return nil if current.nil?
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

  # Time Complexity: O(log n)
  # Space Complexity: O(n) - an new array is created to store the in-order nodes
  
  def inorder
    inorder_array = [] 
    return inorder_array if @root == nil
    current = @root
    return inorder_helper(current, inorder_array)
  end

  def inorder_helper(current, inorder_array)  
    if current == nil
      return inorder_array
    else
      inorder_helper(current.left, inorder_array)
      inorder_array.push({:key => current.key, :value => current.value})
      inorder_helper(current.right, inorder_array)
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(n)    
  def preorder
    array = []
    return array if @root == nil
    current = @root
    return preorder_helper(current, array)
  end

  def preorder_helper(current, array)
    if current == nil
      return array
    else
    array.push({:key => current.key, :value => current.value})
    preorder_helper(current.left, array)
    preorder_helper(current.right, array)
    end
  end

  # Time Complexity: O(log n)
  # Space Complexity: O(n) 
  def postorder
    array = []
    return array if @root == nil
    current = @root
    return postorder_helper(current, array)
  end

  def postorder_helper(current, array)
    if current == nil
      return array
    else
    postorder_helper(current.left, array)
    postorder_helper(current.right, array)
    array.push({:key => current.key, :value => current.value})
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    current = @root
    height = 1
    return 0 if @root.nil?
    return height_helper(current,height)
  end

  def height_helper(current, height)
    if current.nil?
      return height
    else
      height += 1
      height_helper(current.left,height)
    end
  end

  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def bfs
    queue = Queue.new
    if @root.nil?
      return []
    end
    array = []
    queue.push(@root)
    while !queue.empty? 
      node = queue.pop
      array.push({:key => node.key, :value => node.value})
      if !node.left.nil?
        queue.push(node.left)
      end
      if !node.right.nil?
        queue.push(node.right)
      end
    end
    return array
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end

