class Api::V1::GasStationsController < ApplicationController

  def get_all
    gas_stations = GasStation.all
    render json: gas_stations.to_json(methods: [:gas_price, :diesel_price, :alcohol_price, :reputation]), status: :ok
  end

end
