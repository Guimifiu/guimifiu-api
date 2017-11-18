namespace :create do

  desc "Create boycotts"

  task boycott_distributor: :environment do
      graph = Graph.new
      google_maps = GoogleMaps.new
      gas_station_hash = Hash.new
      valid_gas_stations = []
      GasStation.all.each do |gas_station|
      	next if gas_station.gas_price.nil? || gas_station.alcohol_price.nil? || gas_station.diesel_price.nil? || gas_station.reputation.nil?
     	rating = (gas_station.reputation.to_f * 5)/((gas_station.gas_price.to_f + gas_station.alcohol_price.to_f + gas_station.diesel_price.to_f)*2)
      	graph.add_node(node = Node.new(gas_station.id, rating))
      	valid_gas_stations << gas_station
      	gas_station_hash[gas_station.id] = node
      end
      i = 0
      valid_gas_stations.each do |gas_station|
      	gas_stations_nearby = google_maps.get_gas_stations(gas_station.latitude,gas_station.longitude, 5000)
      	gas_stations_nearby.each do |station|
      		station_stored = GasStation.find_by_google_maps_id(station["place_id"])
 			unless station_stored.nil?
 				graph.add_edge(gas_station_hash[station_stored.id],gas_station_hash[gas_station.id])
 			end
      	end
      end
      graph.all_bad_nodes
      graph.check_edges
      graph.all_bad_nodes

      today = DateTime.now
      boycott = Boycott.create(start_date: today, end_date: today+7)

      graph.bad_nodes.each do |node|
        boycott.gas_stations << GasStation.find_by_id(node.name)
      end

      boycott.save
  end
end
