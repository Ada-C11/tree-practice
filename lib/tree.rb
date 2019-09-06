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
      return
    end
    current = @root
    while current
      if key <= current.key
        if current.left
          current = current.left
        else
          current.left = new_node
          break
        end
      else
        if current.right
          current = current.right
        else
          current.right = new_node
          break
        end
      end
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    current = @root
    while current
      if key == current.key
        return current.value
      elsif key < current.key
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
    nodes = []
    if @root
      add_nodes_inorder(root, nodes)
    end
    return nodes
  end

  def add_nodes_inorder(node, array)
    return if !node
    add_nodes_inorder(node.left, array)
    array << { key: node.key, value: node.value }
    add_nodes_inorder(node.right, array)
  end
  # Time Complexity: 
  # Space Complexity: 
  def preorder
    nodes = []
    if @root
      add_nodes_preorder(root, nodes)
    end
    return nodes
  end

  def add_nodes_preorder(node, array)
    return if !node
    array << { key: node.key, value: node.value }
    add_nodes_preorder(node.left, array)
    add_nodes_preorder(node.right, array)   
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    nodes = []
    if @root
      add_nodes_postorder(root, nodes)
    end
    return nodes
  end

  def add_nodes_postorder(node, array)
    return if !node
    add_nodes_postorder(node.left, array)
    add_nodes_postorder(node.right, array)   
    array << { key: node.key, value: node.value }
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    return max_depth(@root)
  end

  def max_depth(node)
    return 0 if !node
    right = max_depth(node.right)
    left = max_depth(node.left)
    return [right, left].max + 1
  end
  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    return [] if !@root
    queue = []
    nodes = []

    queue.push(@root)
    while !queue.empty?
      current = queue.shift
      nodes << { key: current.key, value: current.value }
      queue.push(current.left) if current.left
      queue.push(current.right) if current.right
    end
    return nodes
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
