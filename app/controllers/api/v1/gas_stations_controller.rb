class Api::V1::GasStationsController < ApplicationController

  def get_all
    gas_stations = GasStation.all
    render json: gas_stations, status: :ok
  end

  def get_gas_station_prices gas_station_id
  	gas_station = GasStation.find_by_id(gas_station_id)
  	gasoline_price = gas_station.price_suggestion.find_by_type(1).value
  	alcohol_price = gas_station.price_suggestion.find_by_type(2).value
  	diesel_price = gas_station.price_suggestion.find_by_type(3).value
  end

end
