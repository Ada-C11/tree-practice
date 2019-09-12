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
    if @root == nil
      @root = new_node
    else
      node = @root
      add_value(node, new_node)
    end
  end

  def add_value(current, new_node)
    if !current
      current = new_node
    elsif current.key < new_node.key
      add_value(current.right, new_node)
    else
      add_value(current.left, new_node)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return nil if @head == nil
    find_value(@head, key)
  end

  def find_value(current, key)
    if current.key == key
      return current.value
    elsif current.key > key
      find_value(current.right, key)
    else
      find_value(current.left, key)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return [] if @head == nil
    return inorder_key(@head)
  end

  def inorder_key(current_node)
    values = []
    if !current_node
      return values
    else
      inorder_key(current_node.left)
      values << {key: current.key, value: current.value}
      inorder_key(current_node.right)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return [] if @head == nil
    return preorder_key(@head)
  end

  def preorder_key(current_node)
    values = []
    if !current_node
      return values
    else
      values << {key: current.key, value: current.value}
      preorder_key(current_node.left)
      preorder_key(current_node.right)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return [] if @head == nil
    return postorder_key(@head)
  end

  def postorder_key(current_node)
    values = []
    if !current_node
      return values
    else
      postorder_key(current_node.left)
      postorder_key(current_node.right)
      values << {key: current.key, value: current.value}
    end
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