class Api::V1::RatingsController < ApiController

  before_action :set_user, only: [:create]

  def create
    @rating = @user.ratings.new(rating_params)
    if @rating.save
      render json: @rating, status: :created
    else
      @response =
      {
        'message' => "Validation Failed",
        'errors' => @rating.errors.full_messages
      }
      render json: @response, status: :conflict
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:stars, :gas_station_id, :fuel_supply_id)
  end

  def set_user
    @user = User.find_by_id(params[:user_id])
  end

end
