namespace :create do

  desc "Create boycotts"

  task boycott_distributor: :environment do
      graph = Graph.new
      GasStation.all.each do |gas_station|
      	rating = (gas_station.reputation)/((gas_station.gas_price + gas_station.alcohol_price + gas_station.diesel_price)*2)
      	graph.add_node(Node.new(gas_station.id, rating))
      end
  end
end
