require "pp"
require_relative "graph"
require_relative "node"
require_relative "edge"

graph = Graph.new

graph.add_node(node1 = Node.new("Node #1", 5))
graph.add_node(node2 = Node.new("Node #2", 2))
graph.add_node(node3 = Node.new("Node #3", 1))
graph.add_node(node4 = Node.new("Node #4", 3))
graph.add_node(node5 = Node.new("Node #5", 5))
graph.add_node(node6 = Node.new("Node #6", 3))
graph.add_node(node7 = Node.new("Node #7", 1))
graph.add_node(node8 = Node.new("Node #8", 2))
graph.add_node(node9 = Node.new("Node #9", 1))
graph.add_node(node10 = Node.new("Node #10", 3))
graph.add_node(node11 = Node.new("Node #11", 3))

graph.add_edge(node1,node2,2)
graph.add_edge(node1,node3,4)
graph.add_edge(node2,node3,3)
graph.add_edge(node3,node4,5)
graph.add_edge(node3,node5,3)
graph.add_edge(node4,node5,4)
graph.add_edge(node6,node7,5)
graph.add_edge(node6,node8,6)
graph.add_edge(node7,node8,4)
graph.add_edge(node6,node9,3)
graph.add_edge(node6,node10,5)

graph.all_bad_nodes
puts "\n"
graph.check_edges
puts "\n"
graph.all_bad_nodes

