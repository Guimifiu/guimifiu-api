class Api::V1::GasStationsController < ApplicationController
  
  before_action :search_gas_station, only: [:get_gas_station_prices]

  def get_all
    gas_stations = GasStation.all
    render json: gas_stations, status: :ok
  end

  def get_gas_station_prices
  	
  end

end
