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
    else
      if key <= current.key

        if current.left == nil
          current.left = new_node
        else
          add(key, value, current.left)
        end

      else

        if current.right == nil
          current.right = new_node
        else
          add(key, value, current.right)
        end

      end
    end
  end

  # Time Complexity:
  # Space Complexity:
  def find(key, current = @root)
    if @root == nil
      return nil
    elsif key == current.key
      return current.value
    elsif key <= current.key
      find(key, current.left)
    else
      find(key, current.right)
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder(current = @root, array = [])
    if current == nil
      return array
    else
      inorder(current.left, array)
      array << { key: current.key, value: current.value }
      inorder(current.right, array)
    end
  end



  # Time Complexity: 
  # Space Complexity: 
  def preorder(current = @root, array = [])
    if current  == nil
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

  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs(current = @root, array = [])
    if current == nil
      return array
    else
      bfs(current.left, array)
      array << { key: current.key, value: current.value }
      bfs(current.right, array)
    end
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
