require "pp"
require_relative "graph"
require_relative "node"
require_relative "edge"

graph.add_node(node1 = Node.new("Node #1", 1))
graph.add_node(node2 = Node.new("Node #2", 4))
graph.add_node(node3 = Node.new("Node #3", 5))
graph.add_node(node4 = Node.new("Node #4", 3))
graph.add_node(node5 = Node.new("Node #5", 1))
graph.add_node(node6 = Node.new("Node #6", 3))
graph.add_node(node7 = Node.new("Node #7", 1))
graph.add_node(node8 = Node.new("Node #8", 2))
graph.add_node(node9 = Node.new("Node #9", 1))
graph.add_node(node10 = Node.new("Node #10", 3))
graph.add_node(node11 = Node.new("Node #11", 3))
graph.add_node(node12 = Node.new("Node #12", 3))
graph.add_node(node13 = Node.new("Node #13", 3))

graph.add_edge(node1,node2,2)
graph.add_edge(node1,node3,4)
graph.add_edge(node2,node3,3)
graph.add_edge(node3,node4,5)
graph.add_edge(node3,node5,3)

graph.add_edge(node6,node7,5)

graph.add_edge(node8,node9,6)
graph.add_edge(node9,node10,4)
graph.add_edge(node8,node11,6)
graph.add_edge(node9,node11,4)
graph.add_edge(node10,node11,6)
graph.add_edge(node11,node12,3)
graph.add_edge(node11,node13,5)

