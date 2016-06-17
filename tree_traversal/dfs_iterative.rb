class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end


# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, shallow_fifth_node])



def depth_first_search(num, node)

  stack = [node]
  visited = [node]
  current_node = node

  while stack
    return current_node if current_node.payload == num

    visited << current_node

    if ! stack.last.children.reject {|n| visited.include?(n) }.empty? #if there is an available child from node on top of stack that hasn't been traversed yet
      current_node = stack.last.children.reject {|n| visited.include?(n) }.first #select first child
      stack << current_node
    else
      current_node = stack.pop #remove this node from stack, forcing the algorithm to iterate and check the parent node again for other children
    end

  end
end

puts depth_first_search(11, trunk).inspect
