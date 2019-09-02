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

  # Time Complexity: O(log n) is the best case which is a balanced tree, where n is the number of nodes. Worst case would be O(n) if each nod was more than the previous, or all less than the previous, which would just be a linked list.
  # Space Complexity:O(1) only constant sized variables are used
  def add(key, value)
    node = TreeNode.new(key, value)
    if @root.nil?
      @root = node
      return
    end
    current = @root
    until current == nil
      if current.key > node.key
        if current.left == nil
          current.left = node
          return
        else
          current = current.left
        end
      else
        if current.right == nil
          current.right = node
          return
        else
          current = current.right
        end
      end
    end
  end

  # Time Complexity: O(log n) is the best case which is a balanced tree, where n is the number of nodes. Worst case would be O(n) if each nod was more than the previous, or all less than the previous, which would just be a linked list.
  # Space Complexity:O(1) only constant sized variables are used
  def find(key)
    current = @root
    until current == nil
      if current.key > key
        current = current.left
      elsif current.key < key
        current = current.right
      else
        return current.value
      end
    end
    return nil
  end

  # Time Complexity: O(n) where n is the number of nodes. The inorder recurssive method is called once for each node, and the time complexity for each frame is constant.
  # Space Complexity: Worst Case would be O(n^2) for a completely unbalanced tree, becuase you could have n stack frames and n arrays. Best case for a balances tree would be O(log n)^2 because you would have log n stack frames at once and log n arrays at once.
  def inorder
    node = @root
    return inorder_recurssive(node, [])
  end

  def inorder_recurssive(curr_node, inorder_array)
    return inorder_array if curr_node == nil

    inorder_array = inorder_recurssive(curr_node.left, inorder_array)
    inorder_array.append({ :key => curr_node.key, :value => curr_node.value })
    inorder_array = inorder_recurssive(curr_node.right, inorder_array)
    return inorder_array
  end

  # Time Complexity: O(n) where n is the number of nodes. The inorder recurssive method is called once for each node, and the time complexity for each frame is constant.
  # Space Complexity: Worst Case would be O(n^2) for a completely unbalanced tree, becuase you could have n stack frames and n arrays. Best case for a balances tree would be O(log n)^2 because you would have log n stack frames at once and log n arrays at once.
  def preorder
    node = @root
    return preorder_recurssive(node, [])
  end

  def preorder_recurssive(curr_node, preorder_array)
    return preorder_array if curr_node == nil
    preorder_array.append({ :key => curr_node.key, :value => curr_node.value })
    preorder_array = preorder_recurssive(curr_node.left, preorder_array)
    preorder_array = preorder_recurssive(curr_node.right, preorder_array)
  end

  # Time Complexity: O(n) where n is the number of nodes. The inorder recurssive method is called once for each node, and the time complexity for each frame is constant.
  # Space Complexity: Worst Case would be O(n^2) for a completely unbalanced tree, becuase you could have n stack frames and n arrays. Best case for a balances tree would be O(log n)^2 because you would have log n stack frames at once and log n arrays at once.
  def postorder
    node = @root
    return postorder_recurssive(node, [])
  end

  def postorder_recurssive(curr_node, postorder_array)
    return postorder_array if curr_node == nil
    postorder_array = postorder_recurssive(curr_node.left, postorder_array)
    postorder_array = postorder_recurssive(curr_node.right, postorder_array)
    postorder_array.append({ :key => curr_node.key, :value => curr_node.value })
  end

  # Time Complexity: O(n) where n is the number of nodes. The inorder recurssive method is called once for each node, and the time complexity for each frame is constant.
  # Space Complexity: O(n) is the worst case because you would have n stack frames, where n is the number of nodes. Best case on a balamced tree would be O(log n) because you would have at most the height number of stack frames, which is log n.
  def height
    return 0 if @root == nil
    node = @root
    return height_recurssive(node, 1, 1)
  end

  def height_recurssive(curr_node, curr_height, max_height)
    return max_height if curr_node == nil

    max_height = curr_height if curr_height > max_height
    max_height = height_recurssive(curr_node.left, curr_height += 1, max_height)
    curr_height -= 1
    max_height = height_recurssive(curr_node.right, curr_height += 1, max_height)

    return max_height
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
