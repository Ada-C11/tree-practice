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
  def add(key, value, current = @root)
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
  def find(key, current = @root)
    while (current != nil)
     if current.key == key
       return current.value
     end

      if key < current.key
        if left.nil?
          return nil
        else
          find(key, current.left)
      else
        find(key, current.right)
     end
   end
   return
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder(current = @root, array = [])
    if current == nil
      return array
    elsif left
      inorder(current.left, array)
      array << { key: current.key, value: current.value }
      inorder(current.right, array)

    # if !current
    #   return array
    # else
    #   inorder(current.left, array)
    #   array << { key: current.key, value: current.value }
    #   inorder(current.right, array)
    # end
  end



  # Time Complexity: 
  # Space Complexity: 
  def preorder(current = @root, array = [])
    if current == nil
      return array
    else
      array << { key: current.key, value: current.value }
      preorder(current.left, array)
      preorder(current.right, array)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder(current = @root, array = [])
    if current == nil
      return array
    else
      postorder(current.left, array)
      postorder(current.right, array)
      array << { key: current.key, value: current.value }
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def height(current = @root, array)
    if current == nil
      return nil
    elsif current.left != nil
        array << { key: current.key, value: current.value }
      elsif current.right != nil
        array << { key: current.key, value: current.value }
      end
      return array.length + 1
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
