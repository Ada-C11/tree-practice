class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end

  def add(key, val)
    if key <= @key
      if !left
        @left = TreeNode.new(key, val)
      else
        @left.add(key, val)
      end
    else
      if !right
        @right = TreeNode.new(key, val)
      else
        @right.add(key, val)
      end
    end
  end

  def find(key)
    if key == @key
      return @value
    elsif key < @key
      return nil if !@left
      return @left.find(key)
    else
      return nil if !@right
      return @right.find(key)
    end
  end

  def inorder(tree)
    left.inorder(tree) unless !left
    tree << {key: @key, value: @value}
    right.inorder(tree) unless !right
  end

  def preorder(tree)
    tree << {key: @key, value: @value}
    left.preorder(tree) unless !left
    right.preorder(tree) unless !right
  end

  def postorder(tree)
    left.postorder(tree) unless !left
    right.postorder(tree) unless !right
    tree << {key: @key, value: @value}
  end
end

class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def add(key, value)
    if !@root
      @root = TreeNode.new(key, value)
    else
      @root.add(key, value)
    end
  end

  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find(key)
    return nil if !@root
    return @root.find(key)
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def inorder
    tree = []
    return tree if !@root
    @root.inorder(tree)
    return tree
  end

  # Time Complexity: O(n)
  # Space Complexity:O(n)
  def preorder
    tree = []
    return tree if !@root
    @root.preorder(tree)
    return tree
  end

  # Time Complexity: O(n)
  # Space Complexity: O(n)
  def postorder
    tree = []
    return tree if !@root
    @root.postorder(tree)
    return tree
  end

  # Time Complexity:
  # Space Complexity:
  def height
    #everytime you go to a branch, add 1 to count that starts at 1
    # do both sides, if one is greater return that one
  end

  # Optional Method
  # Time Complexity:
  # Space Complexity:
  def bfs
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end

# class TreeNode

#    def preorder(array)
#     array << { key: @key, value: @value }
#     left.preorder(array) unless left.nil?
#     right.preorder(array) unless right.nil?
#    end

#   def postorder(array)
#     left.postorder(array) unless left.nil?
#     right.postorder(array) unless right.nil?
#     array << { key: @key, value: @value }
#   end

#   def bfs(list)
#     queue = [self]

#     return bfs_helper(queue, list)
#   end

#   private

#     def bfs_helper(queue, list)
#       return list if queue.size == 0
#       first_item = queue.shift
#       list << { key: first_item.key, value: first_item.value }
#       queue << first_item.left unless first_item.left.nil?
#       queue << first_item.right unless first_item.right.nil?

#       return bfs_helper(queue, list)

#     end
# end

#   def preorder
#     list = []
#     @root.preorder(list) unless @root.nil?
#     return list
#   end

#   def postorder
#     list = []
#     @root.postorder(list) unless @root.nil?
#     return list
#   end

#   def bfs
#     list = []
#     return @root.bfs(list) unless @root.nil?
#     return list
#   end
# end
