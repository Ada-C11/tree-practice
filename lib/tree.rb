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

  # Time Complexity: O(n) - possible to visit each node
  # Space Complexity: O(1)
  def height
    return 0 if !@root
    height_helper(@root)
  end

  def height_helper(current)
    return 0 if !current
    left = height_helper(current.left)
    right = height_helper(current.right)

    if left < right
      return right + 1
    else
      return left + 1
    end
  end

  # Optional Method
  # Time Complexity: O(n) - all nodes visited
  # Space Complexity: O(n) - array size based on size of tree
  def bfs
    return [] if !@root

    values = [{key: @root.key, value: @root.value}]
    bfs_helper(@root, values)
  end

  def bfs_helper(current, array)
      if current.left
        array << {key: current.left.key, value: current.left.value}
      end
      if current.right
        array << {key: current.right.key, value: current.right.value}
      end
      if !current.left && !current.right
        return array
      end
      if current.left
        bfs_helper(current.left, array)
      end
      if current.right
        bfs_helper(current.right, array)
      end
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end