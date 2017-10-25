class Api::V1::GasStationsController < ApplicationController

  before_action :set_gas_station, only: [:show]

  def get_all
    gas_stations = GasStation.all
    render json: gas_stations.to_json(methods: [:gas_price, :diesel_price, :alcohol_price, :reputation, :icon]), status: :ok
  end

  def show
    if @gas_station.present?
      render json: @gas_station.to_json(methods: [:gas_price, :diesel_price, :alcohol_price, :reputation, :icon]), status: :ok
    else
      head :not_found
    end
  end

  private

  def set_gas_station
    @gas_station = GasStation.find_by_id(params[:id])
  end

end
