class Api::V1::FuelSuppliesController < ApiController

  before_action :set_user, only: [:create, :index, :history_months]

  def index
    month_year = params[:month_year]
    @fuel_supplies = @user.fuel_supplies.order('created_at DESC')
    if !month_year.nil? && !month_year.empty?
      @fuel_supplies = @fuel_supplies.select { |f| f.created_at.strftime('%m/%Y') == month_year }
    end
    render json: @fuel_supplies.to_json(methods: [:date, :gas_station_name, :gas_station_vicinity, :rating_stars, :fuel_type_translated]), status: :ok
  end

  def history_months
    render json: @user.fuel_supply_history_months
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
    params.require(:fuel_supply).permit(:fuelled, :gas_station_id, :value, :boycotted, :fuel_type)
  end

  def set_user
    @user = User.find_by_id(params[:user_id])
  end
end
