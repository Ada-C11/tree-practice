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

  # Time Complexity: O(log n) - side eliminated
  # Space Complexity: O(1)
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

  # Time Complexity: O(n) - all nodes visited
  # Space Complexity: O(n) - array size based on node amount
  def inorder
    return [] if !@root
    values = []
    inorder_key(@root, values)
  end

  def inorder_key(current_node, array)
    if !current_node
      return array
    else
      inorder_key(current_node.left, array)
      array << {key: current_node.key, value: current_node.value}
      inorder_key(current_node.right, array)
    end
  end

  # Time Complexity: O(n) - all nodes visited
  # Space Complexity: O(n) - array size based on node amount
  def preorder
    return [] if !@root
    values = []
    preorder_key(@root, values)
  end

  def preorder_key(current_node, array)
    if !current_node
      return array
    else
      array << {key: current_node.key, value: current_node.value}
      preorder_key(current_node.left, array)
      preorder_key(current_node.right, array)
    end
  end

  # Time Complexity: O(n) - all nodes visited
  # Space Complexity: O(n) - array size based on node amount
  def postorder
    return [] if !@root
    values = []
    postorder_key(@root, values)
  end

  def postorder_key(current_node, array)
    if !current_node
      return array
    else
      postorder_key(current_node.left, array)
      postorder_key(current_node.right, array)
      array << {key: current_node.key, value: current_node.value}
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