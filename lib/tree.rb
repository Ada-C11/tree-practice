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

  # Time Complexity: O(log(n)) in a balanced tree, where n is the number of nodes in the tree. O(n) in an unbalanced tree.
  # Space Complexity: O(n), where n is the number of nodes in the tree
  def add(key, value)
    new_node = TreeNode.new(key, value)
    if !@root
      @root = new_node
    else
      current = @root
      move_and_add(new_node, current)
      return
    end
  end

  def move_and_add(new, current)
    if new.key < current.key
      if !current.left
        current.left = new
        return
      else
        move_and_add(new, current.left)
      end
    elsif new.key > current.key
      if !current.right
        current.right = new
        return
      else
        move_and_add(new, current.right)
      end
    elsif new.key == current.key
      return
    end
  end

  # Time Complexity: O(log(n)) in a balanced tree, where n is the number of nodes in the tree. O(n) in an unbalanced tree.
  # Space Complexity: O(m), where m is the height of the tree
  def find(key)
    if !@root
      return nil
    end
    current = @root

    return move_and_find(key, current)
  end

  def move_and_find(key, current)
    if key < current.key
      if !current.left
        return nil
      else
        move_and_find(key, current.left)
      end
    elsif key > current.key
      if !current.right
        return nil
      else
        move_and_find(key, current.right)
      end
    elsif key == current.key
      return current.value
    end
  end

  # Time Complexity: O(n), where n is the number of nodes in the tree
  # Space Complexity: O(n), where n is the number of nodes in the tree
  def inorder
    node_array = []
    if !@root
      return node_array
    end
    current = @root

    node_array = traverse_in_order(node_array, current)

    return node_array
  end

  def traverse_in_order(array, current_node)
    if current_node.left
      traverse_in_order(array, current_node.left)
    end
    array.push(pretty_node_object(current_node))
    if current_node.right
      traverse_in_order(array, current_node.right)
    end
    return array
  end

  # Time Complexity: O(n), where n is the number of nodes in the tree
  # Space Complexity: O(n), where n is the number of nodes in the tree
  def preorder
    node_array = []
    if !@root
      return node_array
    end
    current = @root

    node_array = traverse_preorder(node_array, current)

    return node_array
  end

  def traverse_preorder(array, current_node)
    array.push(pretty_node_object(current_node))
    if current_node.left
      traverse_preorder(array, current_node.left)
    end
    if current_node.right
      traverse_preorder(array, current_node.right)
    end
    return array
  end

  # Time Complexity: O(n), where n is the number of nodes in the tree
  # Space Complexity: O(n), where n is the number of nodes in the tree
  def postorder
    node_array = []
    if !@root
      return node_array
    end
    current = @root

    node_array = traverse_postorder(node_array, current)

    return node_array
  end

  def traverse_postorder(array, current_node)
    if current_node.left
      traverse_postorder(array, current_node.left)
    end
    if current_node.right
      traverse_postorder(array, current_node.right)
    end
    array.push(pretty_node_object(current_node))
    return array
  end

  # Time Complexity: O(n), where n is the number of nodes in the tree
  # Space Complexity: O(k + m), where k is the number of leaves in the tree and m is the height of the tree
  def height
    if !@root
      return 0
    end
    results_array = []
    current = @root
    counter = 1
    results_array = traverse_height(results_array, current, counter)

    return results_array.max
  end

  def traverse_height(array, current_node, counter)
    if current_node.left
      traverse_height(array, current_node.left, counter + 1)
    end
    if current_node.right
      traverse_height(array, current_node.right, counter + 1)
    end
    array.push(counter)
    return array
  end

  # Optional Method
  # Time Complexity: O(n), where n is the number of nodes in the tree
  # Space Complexity: O(n), where n is the number of nodes in the tree
  def bfs
    results_array = []
    if !@root
      return results_array
    end
    queue = [@root]

    until queue.length == 0
      current = queue.shift
      if current.left
        queue.push(current.left)
      end
      if current.right
        queue.push(current.right)
      end
      results_array.push(pretty_node_object(current))
    end
    return results_array
  end

  # Structured node for expected test values
  def pretty_node_object(node)
    return { :key => node.key,
            :value => node.value }
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
