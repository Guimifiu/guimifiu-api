class Api::V1::GasStationsController < ApplicationController

  def get_all
    gas_stations = GasStation.all
    render json: gas_stations, status: :ok
  end

end
