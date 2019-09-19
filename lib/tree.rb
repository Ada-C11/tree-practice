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
    else
      add_value(@root, new_node)
    end
  end

  # TODO: Refactor solution with loop
  def add_value(current, new_node)
    if current.key < new_node.key
      if current.right
        add_value(current.right, new_node)
      else
        current.right = new_node
      end
    else
      if current.left
        add_value(current.left, new_node)
      else
        current.left = new_node
      end
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return nil if !@root

    current = @root

    while current
      return current.value if current.key == key
      
      if current.key < key
        current = current.right
      else
        current = current.left
      end
    end
    return nil
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return [] if !@head
    values = []
    return inorder_key(@head, values)
  end

  def inorder_key(current_node, array)
    if !current_node
      return array
    else
      inorder_key(current_node.left)
      varray << {key: current_node.key, value: current_node.value}
      inorder_key(current_node.right)
    end
    return
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
    postorder_key(@head)
  end

  def postorder_key(current_node)
    values = []
    if !current_node
      return values
    else
      postorder_key(current_node.left)
      postorder_key(current_node.right)
      values << {key: current_node.key, value: current_node.value}
    end
    return values
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