QUEUE_SIZE = 20

class Queue
  def initialize
    @store = Array.new(QUEUE_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if @front == -1 # Q is empty
      @rear = 1
      @front = 0
      @store[@front] = element
    elsif @front == @rear && !self.empty?
      raise Error, "Q IS FULL"
    else #not empty
      new_rear = (@rear + 1) % QUEUE_SIZE
      @store[@rear] = element
      @rear = new_rear
    end
  end

  def dequeue
    if @front == -1
      return nil
    end
    index_to_remove = @front
    value_to_remove = @store[index_to_remove]
    @store[index_to_remove] = nil
    @front += 1
    return value_to_remove
  end

  def front
    return @store[@front]
  end

  def size
    size = 0
    return 0 if self.empty?

    @store.each do |i|
      if i != nil
        size += 1
      end
    end

    return size
  end

  def empty?
    return true if self.to_s == "[]"
    return false
  end

  def to_s
    values = []
    @store.each do |i|
      if i != nil
        values << i
      end
    end

    return values.to_s
  end
end

class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end

  def add(key, value)
    new_node = TreeNode.new(key, value)
    if new_node.key <= @key
      if @left == nil
        @left = new_node
      else
        @left.add(key, value)
      end
    else
      if @right == nil
        @right = new_node
      else
        @right.add(key, value)
      end
    end
  end

  def inorder(array)
    if @left != nil
      @left.inorder(array)
    end

    array << {key: @key, value: @value}

    if @right != nil
      @right.inorder(array)
    end
  end

  def preorder(array)
    array << {key: @key, value: @value}

    if @left != nil
      @left.preorder(array)
    end

    if @right != nil
      @right.preorder(array)
    end
  end

  def postorder(array)
    if @left != nil
      @left.postorder(array)
    end

    if @right != nil
      @right.postorder(array)
    end

    array << {key: @key, value: @value}
  end
end

class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  # Time Complexity: O(log n) if the tree is balanced, where n is the number of nodes in the tree.
  # Space Complexity: O(1)
  def add(key, value)
    if @root == nil
      @root = TreeNode.new(key, value)
    else
      @root.add(key, value)
    end
  end

  # Time Complexity: O(log n) if the tree is balanced, where n is the number of nodes in the tree.
  # Space Complexity: O(1)
  def find(key)
    current = @root

    if current == nil
      return nil
    end

    while current != nil
      if key == current.key
        return current.value
      elsif key <= current.key
        current = current.left
      else
        current = current.right
      end
    end
  end

  # Time Complexity: O(n) where n is the number of nodes in the tree
  # Space Complexity: O(n) where n is the number of nodes in the tree
  # left root right
  def inorder
    current = @root
    values = []
    if current != nil
      current.inorder(values)
    end
    return values
  end

  # Time Complexity: O(n) where n is the number of nodes in the tree
  # Space Complexity: O(n) where n is the number of nodes in the tree
  def preorder
    current = @root
    values = []
    if current != nil
      current.preorder(values)
    end
    return values
  end

  # Time Complexity: O(n) where n is the number of nodes in the tree
  # Space Complexity: O(n) where n is the number of nodes in the tree
  def postorder
    current = @root
    values = []
    if current != nil
      current.postorder(values)
    end
    return values
  end

  # Time Complexity: O(n) where n is the number of nodes in the tree
  # Space Complexity: O(1)
  def height(node)
    if node == nil
      return 0
    else
      left_height = height(node.left)
      right_height = height(node.right)
      if left_height >= right_height
        return 1 + left_height
      else
        return 1 + right_height
      end
    end
  end

  # Optional Method
  # Time Complexity: O(n) where n is the number of nodes in the tree
  # Space Complexity: O(n) where n is the number of nodes in the tree
  def bfs
    if @root == nil
      return []
    end

    queue = Queue.new
    queue.enqueue(@root)
    bfs_values = []

    while queue.size > 0
      node = queue.front
      bfs_values << {key: node.key, value: node.value}
      queue.enqueue(node.left) unless node.left == nil
      queue.enqueue(node.right) unless node.right == nil
      queue.dequeue
    end

    return bfs_values
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
