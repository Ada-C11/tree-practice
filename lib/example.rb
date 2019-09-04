class TreeNode
  attr_accessor :value, :left, :right

  def initialize(val)
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

  def add(value)
    new_node = TreeNode.new(value)
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end
  end

  def add_helper(current, new_node)
    return new_node if current.nil?
    if new_node <= current.value
      current.left = add_helper(current.left, new_node)
    else
      current.right = add_helper(current.right, new_node)
    end

    return current
  end

  def inorder(current, array)
    if current == nil
      return
    else
      inorder(current.left, array)
      array << current.value
      inorder(current.right, array)
    end
  end

  def loop_traverse(root)
    stack = []
    output = []
    current = root
    while (current || !stack.empty?)
      while (current)
        stack.push(current)
        current = current.left
      end
      current = stack.pop
      output.push(current.value);  #storing the data
      current = current.right
    end
    puts "loop_traverse:"  #prints out the output
    puts output.join(" ")
  end
end
