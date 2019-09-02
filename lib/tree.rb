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
    end

    if new_node.key <= @root.key
      @root.left = new_node
    else
      @root.right = new_node
    end
    return
  end

  # Time Complexity:
  # Space Complexity:
  def find(key)
    current = @root

    if current == nil
      return nil
    end

    while (current != nil)
      if current.key == key
        return current.value
      end

      if key < current.key
        current = current.left
      else
        current = current.right
      end
    end
    return
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    current = @root
    array = []

    if current == nil
      return
    end
    
    if array.empty?
      return []
    end

    while (current != nil)
      if (current.left == nil)
        pre = current.right
      else
        array.push({:key => current.left.key, :value => current.left.value})
      end

      if (current.right == nil)
        pre = current.right
      else
        array.push({:key => current.right.key, :value => current.right.value})
      end
    end
  end

  # def inorder_helper(current)
  #   if current == nil
  #     return
  #   end


  # end

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

