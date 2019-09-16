class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
    @parent = nil
  end
end

class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  # Time Complexity: O(logn)
  # Space Complexity: O(1)
  def add(key, value)
    new_node = TreeNode.new(key, value)
    return @root = new_node unless @root
    add_node(@root, new_node)
  end

  def add_node(root, new_node)
    if new_node.key < root.key
      return root.left = new_node unless root.left
      add_node(root.left, new_node)
    elsif new_node.key > root.key
      return root.right = new_node unless root.right
      add_node(root.right, new_node)
    end
  end

  # Time Complexity: O(n) / O(logn)
  # Space Complexity: O(1)
  def find(key)
    return find_helper(key, @root)
  end

  def find_helper(key, node)
    return nil unless node
    if key == node.key
      return node.value
    elsif key < node.key
      find_helper(key, node.left)
    else key > node.key
      find_helper(key, node.right)     end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    array = []
    inorder_helper(array, @root)
  end

  def inorder_helper(array, node)
    return array unless node
    inorder_helper(array, node.left)
    node_kv = {}
    node_kv[:key] = node.key
    node_kv[:value] = node.value
    array.push(node_kv)
    inorder_helper(array, node.right)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def preorder
    array = []
    return preorder_helper(array, @root)
  end

  def preorder_helper(array, node)
    return array unless node
    node_kv = {}
    node_kv[:key] = node.key
    node_kv[:value] = node.value
    array.push(node_kv)
    preorder_helper(array, node.left)
    preorder_helper(array, node.right)
  end

  # Time Complexity:
  # Space Complexity:
  def postorder
    array = []
    postorder_helper(@root, array)
    return array
  end

  def postorder_helper(root, array)
    return unless root
    postorder_helper(root.left, array)
    postorder_helper(root.right, array)
    array.push({ key: root.key, value: root.value })
  end

  # Time Complexity:
  # Space Complexity:
  def height
    height_counter(@root)
  end

  def height_counter(node)
    return 0 unless node
    left_counter = height_counter(node.left)
    right_counter = height_counter(node.right)
    counter = left_counter > right_counter ? left_counter : right_counter
    return counter += 1
  end

  # Optional Method
  # Time Complexity: O(n)
  # Space Complexity: O(2n)

  # i know there will be less lines of code if q is implemented, please see commented psuedocode below for q implementation
  def bfs
    return [] unless @root
    array = [@root]
    i = 0
    current = @root
    length = 1
    until (i == length - 1) && (current.left == nil) && (current.right == nil)
      if current.left
        array.push(current.left)
        length += 1
      end
      if current.right
        array.push(current.right)
        length += 1
      end
      i += 1
      current = array[i]
    end
    return array.map do |node|
             { key: node.key, value: node.value }
           end
  end

  #   BFS USING QUEUE
  # Time Complexity: O(n)
  # Space Complexity: O(2n)
  # def bfs
  # q = Queue.new(@root)
  # array = []
  # until q is_empty
  # current = q.dequeue
  # array.push({key: current.key, value: current.value })
  # q.enqueue(current.left) if current.left
  # q.enqueue(current.right) if current.right
  # end
  # return array
  # end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
