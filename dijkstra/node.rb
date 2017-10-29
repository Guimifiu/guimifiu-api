class Node
  attr_accessor :name, :rating, :graph, :adjacent_nodes, :is_bad_node

  def initialize(name, rating)
    @name = name
    @rating = rating
    @adjacent_nodes = []
    @is_bad_node = false
  end

  def adjacent_edges
    graph.edges.select{|e| e.from == self}
  end

  def to_s
    @name
  end
end
