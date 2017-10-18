class GasStation < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  has_many :price_suggestions
  has_many :users_price_suggestions, through: :price_suggestions, class_name: 'User'
  has_many :fuel_supplies
  has_many :users_fuel_supplies, through: :fuel_supplies, class_name: 'User'
  has_many :ratings
  has_many :users_ratings, through: :ratings, class_name: 'User'
  has_and_belongs_to_many :boycotts

  def gas_price
    price_suggestion = self.price_suggestions.where(fuel_type: 'gas').last
    price_suggestion.nil? ? nil : price_suggestion.value
  end

  def alcohol_price
    price_suggestion = self.price_suggestions.where(fuel_type: 'alcohol').last
    price_suggestion.nil? ? nil : price_suggestion.value
  end

  def diesel_price
    price_suggestion = self.price_suggestions.where(fuel_type: 'diesel').last
    price_suggestion.nil? ? nil : price_suggestion.value
  end

  def reputation
    stars = self.ratings.average(:stars)
    return number_with_precision(stars, precision: 2, separator: '.')
  end
end
