class Graph
  attr_accessor :nodes
  attr_accessor :edges
  attr_accessor :bad_nodes
  attr_accessor :changed_nodes

  def initialize
    @nodes = []
    @edges = []
    @bad_nodes = []
    @changed_nodes = []
  end

  def add_node(node)
    nodes << node
    node.graph = self
    if node.rating < 1
      node.is_bad_node = true
      bad_nodes << node
    end
  end

  def add_edge(from, to)
    edges << Edge.new(from, to)
  end

  def check_edges
    puts "Check edges:"
    nodes.each do |node|
      puts node.name
      if node.is_bad_node && (all_adjacent_nodes_are_bad(node) || node.adjacent_nodes.empty?)
        node.is_bad_node = false
      end
    end
  end

  def all_adjacent_nodes_are_bad(node)
    node.adjacent_nodes.each do |adjacent_node|
      if !adjacent_node.is_bad_node
        return false
      end
    end
    return true
  end

  def all_bad_nodes
    puts "Bad Nodes:"
    nodes.each do |node|
      puts node.name if node.is_bad_node
    end
  end
end
