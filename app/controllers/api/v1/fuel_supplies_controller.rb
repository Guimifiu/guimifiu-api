class Api::V1::FuelSuppliesController < ApplicationController

  def create
    @fuel_supply = FuelSupply.new(fuel_supply_params)
    if @fuel_supply.save
      render json: @fuel_supply, status: :created
    else
      @response =
      {
        'message' => "Validation Failed",
        'errors' => @fuel_supply.errors.full_messages,
      }
      render json: @response, status: :conflict
    end
  end

  private
  def fuel_supply_params
    params.require(:fuel_supply).permit(:fuelled, :user_id, :gas_station_id, :value, :boycotted)
  end

end
