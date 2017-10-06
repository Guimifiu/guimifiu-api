class Api::V1::FuelSuppliesController < ApplicationController

  before_action :set_user, only: [:create, :index]

  def index
    @fuel_supplies = @user.fuel_supplies
    render json: @fuel_supplies, status: :ok
  end

  def create
    @fuel_supply = @user.fuel_supplies.new(fuel_supply_params)
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
    params.require(:fuel_supply).permit(:fuelled, :gas_station_id, :value, :boycotted)
  end

  def set_user
    @user = User.find_by_id(params[:user_id])
  end
end
