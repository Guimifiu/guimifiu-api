class Edge
  attr_accessor :from, :to

  def initialize(from, to)
    @from, @to = from, to
    if from.is_a?(Node) && to.is_a?(Node)
      from.adjacent_nodes << to
      to.adjacent_nodes << from
    end
  end

end
