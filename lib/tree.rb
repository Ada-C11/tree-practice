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

  # Time Complexity: O(logn) if the tree is balanced (best case), O(n) if tree is unbalanced (worst case)
  # Space Complexity: O(1)
  def add(key, value)
    if !@root
      new_node = TreeNode.new(key, value)
      @root = new_node
      return
    end

    current = @root
    new_node = TreeNode.new(key, value)

    until !current
      if new_node.key <= current.key # GO LEFT
        if !current.left
          current.left = new_node
          return
        else
          current = current.left
        end
      else # new_node.value > current.value # GO RIGHT
        if !current.right
          current.right = new_node
          return
        else
        current = current.right
        end
      end
    end
  end

  # Time Complexity: O(logn) where n is the length of the array if the tree is balanced. O(n) if not.
  # Space Complexity: O(1)
  def find(key)
    return nil if !@root
    current = @root

    until current == nil
      return current.value if key == current.key
      key < current.key ? current = current.left : current = current.right
    end

  end

  # Time Complexity: O(n-squared) 
  # Space Complexity: O(n) where n is the height of the recursion stack
  def inorder
    @output = []
    current = @root

    return @output if !@root

    def analyze(current)
      analyze(current.left) if current.left
      @output << {:key => current.key, :value => current.value}
      analyze(current.right) if current.right
    end
    
    analyze(current)
  
    return @output
  end

  # Time Complexity:
  # Space Complexity:
  def preorder
    raise NotImplementedError
  end

  # Time Complexity:
  # Space Complexity:
  def postorder
    raise NotImplementedError
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
