# build a simple binary tree data structure from some arbitray input and
# also the 'crawler' function that will locate data inside it

# build a class Node. It should have a 'value' that it stores and also
# links to its parent and children
class Node
  attr_accessor :value, :parent, :left_child, :right_child

  def initialize(value, parent=nil, left_child=nil, right_child=nil)
    @value = value
    @parent = parent
    @left_child = left_child
    @right_child = right_child
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(root=nil)
    @root = root
  end

# turns an array into a binary tree full of appropriately placed node objects
  def build_tree(array)
    array.each do |node|
      if @root.nil?
        @root = Node.new(node) # assigns root the initial node.
      else
        add_node(node, @root) # then add nodes to the correct place in tree(parent, child)
      end
    end
  end

 # adds node to the correct place in tree(parent, left_child, right_child)
 # uses @root in the beginning to compare with data
  def add_node(data, node=@root)
    if data <= node.value && node.left_child.nil? # if data is less than root and there's no node to the left of root
      node.left_child = Node.new(data) # the new node will be the left_child of root(parent)
      node.left_child.parent = node # the new node's parent is node(root)
    elsif data > node.value && node.right_child.nil? # same as above but for the right side
      node.right_child = Node.new(data)
      node.right_child.parent = node
    # if there's existing child
    else data <= node.value ? add_node(data, node.left_child) : add_node(data, node.right_child)
    end
  end

# using breadth first search technique(Level-Order Traversal):
# visit all nodes at a particular depth or level before
# visiting the nodes at the next deeper level
  def breadth_first_search(value)
    # using an array acting as a queue to keep track of all the
    # child nodes that have yet to search
    queue = [@root]
    until queue.empty?
      current = queue.shift
      return current.value if current.value == value

      unless current.left_child.nil?
        queue << current.left_child # add left_child to queue to be compared
      end
      unless current.right_child.nil?
        queue << current.right_child # add right_child to queue to be compared
      end
    end
  end

  # returns the node at which the target value is located Using
  # the depth first search technique
  def depth_first_search(value)
    # using an array acting as a stack to keep track of all the
    # child nodes that have yet to search
    stack = [@root]
    until stack.empty?
      current = stack.pop
      return current.value if current.value == value

      unless current.right_child.nil?
        stack << current.right_child # add right_child to stack to be compared
      end
      unless current.left_child.nil?
        stack << current.left_child # add left_child to stack to be compared
      end
    end
  end

  # runs a depth first search but instead of using a stack, use recursive
  def dfs_rec(target, current=@root)
    return nil if current.nil?
    return current.value if current.value == target
    dfs_rec(target, current.left_child) unless current.left_child.nil? # recursively replaces root with left child.
    dfs_rec(target, current.right_child) unless current.right_child.nil? # same for the right side only after all left childs have been checked
  end

end

test_tree = BinaryTree.new
print "#{test_tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])}\n"
puts test_tree.breadth_first_search(6345)
puts test_tree.depth_first_search(23)
puts test_tree.dfs_rec(6345)
puts test_tree.dfs_rec(60)
