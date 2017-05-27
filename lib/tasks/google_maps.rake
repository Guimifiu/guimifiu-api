namespace :populate do

  desc "Populate database with database from google maps"

  task gas_station: :environment do
    gas_stations_created_count = 0

    google_maps = GoogleMaps.new
    gas_stations = google_maps.get_gas_stations("-15.766267", "-47.871106", "10000")
    

    gas_stations.each do |gas_station|
      new_gas_station = GasStation.find_by_google_maps_id(gas_station['place_id'])
      next if new_gas_station.present?
      puts "Name/GoogleMaps-id:"
      puts "#{gas_station['name']} - #{gas_station['id']}"
      if new_gas_station.nil?
        new_gas_station = GasStation.new(
          name: gas_station['name'],
          latitude: gas_station['geometry']['location']['lat'],
          longitude: gas_station['geometry']['location']['lng'],
          google_maps_id: gas_station['place_id'],
          vicinity: gas_station['vicinity']
        )
      end
      if new_gas_station.save
        gas_stations_created_count += 1
      else
        puts "ERROR ON populate:gast_station: #{new_gas_station.errors.full_messages.to_sentence}"
      end
    end

    puts "Total Gas Stations Created: #{gas_stations_created_count}"
  end
end
