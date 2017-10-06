class Api::V1::PriceSuggestionsController < ApplicationController

  def create
    @price_suggestion = PriceSuggestion.new(price_suggestion_params)
    if @price_suggestion.save
      render json: @price_suggestion, status: :created
    else
      @response =
      {
        'message' => "Validation Failed",
        'errors' => @price_suggestion.errors.full_messages,
      }
      render json: @response, status: :conflict
    end
  end

  private
  def price_suggestion_params
    params.require(:price_suggestion).permit(:fuel_type, :user_id, :gas_station_id, :value)
  end

end
