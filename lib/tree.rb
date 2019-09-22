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

  # Time Complexity: O(log n) - side eliminated
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)

    if !@root
      @root = new_node
    else
      current = @root
      until !current
        if current.key < new_node.key
          if current.right
            current = current.right
          else
            return current.right = new_node
          end
        else
          if current.left
            current = current.left
          else
            return current.left = new_node
          end
        end
      end
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return nil if !@root

    current = @root

    until !current
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