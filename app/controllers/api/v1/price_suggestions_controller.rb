class Api::V1::PriceSuggestionsController < ApiController

  before_action :set_user, only: [:create]

  def create
    @price_suggestion = @user.price_suggestions.new(price_suggestion_params)
    if @price_suggestion.save
      render json: @price_suggestion, status: :created
    else
      @response =
      {
        'message' => "Validation Failed",
        'errors' => @price_suggestion.errors.full_messages
      }
      render json: @response, status: :conflict
    end
  end

  private
  def price_suggestion_params
    params.require(:price_suggestion).permit(:fuel_type, :gas_station_id, :value)
  end

  def set_user
    @user = User.find_by_id(params[:user_id])
  end

end
