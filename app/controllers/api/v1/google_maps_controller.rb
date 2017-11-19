class Api::V1::GoogleMapsController < ApiController
  before_action :set_google_maps, only: [:get_place_location, :get_gas_stations_on_direction, :get_closest_gas_stations, :get_direction]

  def get_place_location
    body = @google_maps.get_place_location(params[:place_id])
    id = body['result']['place_id']
    name = body['result']['name']
    vicinity = body['result']['vicinity']
    latitude = body['result']['geometry']['location']['lat']
    longitude = body['result']['geometry']['location']['lng']
    place = {
      "id": id,
      "name": name,
      "vicinity": vicinity,
      "latitude": latitude,
      "longitude": longitude
    }
    render json: place, status: :ok
  end

  def get_gas_stations_on_direction
    origin = params[:origin]
    destination = params[:destination]
    body = @google_maps.get_direction(origin, destination)

    distance = body['routes'][0]['legs'][0]['distance']['text']
    duration = body['routes'][0]['legs'][0]['duration']['text']
    @gas_stations_found = []
    body['routes'][0]['legs'][0]['steps'].each do |step|
      step_end_lat = step['end_location']['lat']
      step_end_lng = step['end_location']['lng']
      save_gas_stations(step_end_lat, step_end_lng, 1500)
      puts " Distância: #{step['distance']['text']}"
    end
    render json: @gas_stations_found.to_json(methods: [:gas_price, :diesel_price, :alcohol_price, :reputation, :icon, :boycotted]), status: :ok
  end

  def get_direction
    origin = params[:origin]
    destination = params[:destination]
    body = @google_maps.get_direction(origin, destination)
    p body['routes'][0]['legs'][0]['distance']
    p body['routes'][0]['legs'][0]['duration']
    response = {
      "distance": body['routes'][0]['legs'][0]['distance']['text'],
      "duration": body['routes'][0]['legs'][0]['duration']['text']
    }
    render json: response.to_json
  end

  def get_closest_gas_stations
    latitude = params[:latitude]
    longitude = params[:longitude]
    @gas_stations_found = []
    save_gas_stations(latitude, longitude, 5000)
    render json: @gas_stations_found.to_json(methods: [:gas_price, :diesel_price, :alcohol_price, :reputation, :icon, :boycotted]), status: :ok
  end

  private
  def set_google_maps
    @google_maps = GoogleMaps.new
  end

  def save_gas_stations(latitue, longitude, radius)
    gas_stations_created_count = 0
    gas_stations = @google_maps.get_gas_stations(latitue, longitude, radius)
    gas_stations.each do |gas_station|
      new_gas_station = GasStation.find_by_google_maps_id(gas_station['place_id'])
      if new_gas_station.present?
        @gas_stations_found << new_gas_station
        next
      else
        puts "Name/GoogleMaps-id:"
        puts "#{gas_station['name']} - #{gas_station['id']}"
        new_gas_station = GasStation.new(
          name: gas_station['name'],
          latitude: gas_station['geometry']['location']['lat'],
          longitude: gas_station['geometry']['location']['lng'],
          google_maps_id: gas_station['place_id'],
          vicinity: gas_station['vicinity']
        )
      end
      if new_gas_station.save
        @gas_stations_found << new_gas_station
        gas_stations_created_count += 1
      else
        puts "ERROR ON populate:gast_station: #{new_gas_station.errors.full_messages.to_sentence}"
      end
    end

    puts "Total Gas Stations Created: #{gas_stations_created_count}"
  end
end
