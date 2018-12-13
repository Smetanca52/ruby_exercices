class Node
  attr_reader :value
  attr_accessor :left, :right

    def initialize(value)
      @value = value
      @left = nil
      @right = nil
    end
end

class Tree
  attr_accessor :root

def build_tree(arr)
  @root = Node.new(arr.shift)
  arr.each{ |e| insert_node(@root, e) }
end

def insert_node(node, value)
  if value > node.value
    node.right ? insert_node(node.right, value) : node.right = Node.new(value)
  else
    node.left ? insert_node(node.left, value) : node.left = Node.new(value)
  end
end

def breadth_first_search(value)
  return nil if @root.nil?
  queue = [@root]
  until queue.empty?
    current = queue.shift
    return current if current.value == value
    queue << current.left unless current.left.nil?
    queue << current.right unless current.right.nil?
  end
  nil
end

def depth_first_search(value)
  return nil if @root.nil?
  stack = [@root]
  until stack.empty?
    current = stack.pop
    return current if current.value == value
    stack << current.right unless current.right.nil?
    stack << current.left unless current.left.nil?
  end
  nil
end

def dfs_rec(value, current=@root)
  return nil if current.nil?
  return current if current.value == value
  left = dfs_rec(value, current.left)
  right = dfs_rec(value, current.right)
  left || right
end
end

tree = Tree.new
tree.build_tree([23, 4, 7, 8, 7, 4, 1, 67, 3, 6345, 5, 9, 324, 9])
tree.breadth_first_search(8)
tree.depth_first_search(67)
tree.dfs_rec(7)
