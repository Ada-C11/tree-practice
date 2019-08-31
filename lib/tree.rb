require "pry"

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
    if @root.nil?
       @root = new_node
    end
    root = @root
    add_helper(root, new_node)

  end

  def add_helper(root, new_node)
    if root.nil?
        return root = new_node
    elsif new_node.key < root.key
        root.left = add_helper(root.left, new_node)
    elsif new_node.key > root.key
        root.right = add_helper(root.right, new_node)
    end

    return root
  end



  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    return nil if @root.nil?
    root = @root
    find_helper(root, key)
  end

  def find_helper(root, key)
    return nil if root.nil?

    if key == root.key
        return root.value
    elsif key < root.key
        find_helper(root.left, key)
    elsif key > root.key
        find_helper(root.right, key)
    end

  end


  # Time Complexity: 
  # Space Complexity: 
  def inorder
    node = @root
    return [] if (node.nil?)
    inorder_array = []
    inorder_helper(node.left, inorder_array)
    inorder_array << {key: node.key, value: node.value}

    inorder_helper(node.right, inorder_array)

    return inorder_array
  end

  def inorder_helper(node, array)
    return if node.nil?
    inorder_hash = {}
    inorder_helper(node.left, array)
    inorder_hash[:key] = node.key
    inorder_hash[:value] = node.value
    array << inorder_hash
    inorder_helper(node.right, array)
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
  #root, left, right
    node = @root
    return [] if node.nil?
    preorder_array = [ {key: node.key, value: node.value}]
    preorder_helper(node.left, preorder_array)
    preorder_helper(node.right, preorder_array)

    return preorder_array
  end

  def preorder_helper(node, array)
      return if node.nil?
      preorder_hash = {}
      preorder_hash[:key] = node.key
      preorder_hash[:value] = node.value
      array << preorder_hash
      preorder_helper(node.left, array)
      preorder_helper(node.right, array)
   end

  # Time Complexity: 
  # Space Complexity:
  # left, right, root
  def postorder
    node = @root
    return [] if node.nil?
    postorder_array = []
    postorder_helper(node.left, postorder_array)
    postorder_helper(node.right, postorder_array)
    postorder_array << {key: node.key, value: node.value}

    return postorder_array
  end

  def postorder_helper(node, array)
        return if node.nil?
        postorder_hash = {}
        postorder_helper(node.left, array)
        postorder_helper(node.right, array)
        postorder_hash[:key] = node.key
        postorder_hash[:value] = node.value
        array << postorder_hash

     end

  # Time Complexity: 
  # Space Complexity: 
  def height
    return 0 if @root.nil?
    node = @root
    return height_helper(node)
  end

  def height_helper(node)
    return 0 if node.nil?
    left_height = height_helper(node.left);
    right_height = height_helper(node.right);

    if (left_height > right_height)
        return (left_height + 1);
    else
        return (right_height + 1);
    end
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
