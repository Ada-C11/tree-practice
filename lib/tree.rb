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

  # Time Complexity: O(log h) if balanced
  # Space Complexity: O(log h) id balanced
  def add(key, value)
    new_node = TreeNode.new(key, value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  def add_helper(current, new_node)
    if new_node.key <= current.key
      if current.left
        add_helper(current.left, new_node)
      else
        current.left = new_node
      end
    else
      if current.right
        add_helper(current.right, new_node)
      else
        current.right = new_node
      end
    end
  end

  # Time Complexity: O(log h) if balanced
  # Space Complexity: O(1)
  def find(key)
    return nil if @root.nil?
    current = @root
    while !current.nil?
      if key == current.key
        return current.value
      elsif key <= current.key
        current = current.left
      else
        current = current.right
      end
    end
  end

  # Time Complexity:  O(n^2)
  # Space Complexity: O(n)
  def inorder
    current = root
    stack = []
    output = []
    while current || !stack.empty?
      while !current.nil?
        stack.push(current)
        current = current.left
      end
      current = stack.pop
      new_hash = Hash.new
      new_hash[:key] = current.key
      new_hash[:value] = current.value
      output.push(new_hash);  #storing the data
      current = current.right
    end
    return output
  end

  # Time Complexity: O(log n) if balanced
  # Space Complexity: O(h)
  def preorder
    #raise NotImplementedError
    stack = []
    output = []
    current = @root
    return [] if current.nil?
    stack.push(current)
    while !stack.empty?
      current = stack.pop()
      new_hash = Hash.new
      new_hash[:key] = current.key
      new_hash[:value] = current.value
      output.push(new_hash)
      if current.right
        stack.push(current.right)
      end
      if current.left
        stack.push(current.left)
      end
    end
    return output
  end

  # Time Complexity: O(log h) if balanced
  # Space Complexity: O(h)
  def postorder
    #raise NotImplementedError
    stack = []
    output = []
    return [] if @root.nil?
    stack.push(@root)
    while !stack.empty?
      current = stack.pop()
      new_hash = Hash.new
      new_hash[:key] = current.key
      new_hash[:value] = current.value
      output.push(new_hash)
      if current.left
        stack.push(current.left)
      end
      if current.right
        stack.push(current.right)
      end
    end
    return output.reverse
  end

  # Time Complexity: O(n)
  # Space Complexity:  O(h)
  def height
    #raise NotImplementedError
    stack = []
    current = @root
    stack.push(current)
    count_left = 0
    count_right = 0
    max_count = 0
    while !stack.empty?
      current = stack.pop
      if current.left
        count_left += 1
        stack.push(current.left)
      else
        if count_left > max_count
          max_count = count_left
          count_left = 0
        end
      end
      if current.right
        count_right += 1
        stack.push(current.right)
      else
        if count_right > max_count
          max_count = count_right
          count_right = 0
        end
      end
    end
    return max_count
  end

  # Optional Method
  # Time Complexity: O(log h) if balanced
  # Space Complexity:  O(h)
  def bfs
    #raise NotImplementedError
    return [] if @root.nil?
    queue = []
    output = []
    queue.push(@root)
    while !queue.empty?
      current = queue[0]
      new_hash = Hash.new
      new_hash[:key] = current.key
      new_hash[:value] = current.value
      output.push(new_hash)
      if current.left
        queue.push(current.left)
      end
      if current.right
        queue.push(current.right)
      end
      queue = queue[1..-1]
    end
    return output
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
