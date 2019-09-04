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

    def analyzeInorder(current)
      analyzeInorder(current.left) if current.left
      @output << {:key => current.key, :value => current.value}
      analyzeInorder(current.right) if current.right
    end
    
    analyzeInorder(current)
  
    return @output
  end

  # Time Complexity: O(n-squared) 
  # Space Complexity: O(n) where n is the height of the recursion stack
  def preorder
    @output = []
    current = @root

    return @output if !@root

    def analyzePreorder(current)
      @output << {:key => current.key, :value => current.value}
      analyzePreorder(current.left) if current.left
      analyzePreorder(current.right) if current.right
    end
    
    analyzePreorder(current)
  
    return @output
  end

  # Time Complexity: O(n-squared) 
  # Space Complexity: O(n) where n is the height of the recursion stack
  def postorder
    @output = []
    current = @root

    return @output if !@root

    def analyzePostorder(current)
      analyzePostorder(current.left) if current.left
      analyzePostorder(current.right) if current.right
      @output << {:key => current.key, :value => current.value}
    end
    
    analyzePostorder(current)
  
    return @output
  end

  # Time Complexity: O(log n) if tree is balanced, O(n) if unbalanced
  # Space Complexity: O(1)
  def height
    return 0 if !@root

    def findMaxHeight(node)
      return 0 if !node

      height_left = findMaxHeight(node.left)
      height_right = findMaxHeight(node.right)
      
      return height_left > height_right ? (height_left + 1) : (height_right + 1)
    end
    
    findMaxHeight(@root)
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
