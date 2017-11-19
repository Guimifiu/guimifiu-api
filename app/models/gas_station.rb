class GasStation < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  has_many :price_suggestions
  # has_many :users_price_suggestions, through: :price_suggestions, class_name: 'User'
  has_many :fuel_supplies
  # has_many :users_fuel_supplies, through: :fuel_supplies, class_name: 'User'
  has_many :ratings
  # has_many :users_ratings, through: :ratings, class_name: 'User'
  has_and_belongs_to_many :boycotts
  belongs_to :distributor

  def gas_price
    price_suggestion = price_suggestions.where(fuel_type: 'gas').last
    price_suggestion.nil? ? nil : price_suggestion.value
  end

  def alcohol_price
    price_suggestion = price_suggestions.where(fuel_type: 'alcohol').last
    price_suggestion.nil? ? nil : price_suggestion.value
  end

  def diesel_price
    price_suggestion = price_suggestions.where(fuel_type: 'diesel').last
    price_suggestion.nil? ? nil : price_suggestion.value
  end

  def reputation
    stars = ratings.average(:stars)
    return number_with_precision(stars, precision: 2, separator: '.')
  end

  def icon
    return distributor.image_path if !distributor.nil?
    return 'pump_map'
  end

  def boycotted
    current_date = Date.today
    current_boycott = Boycott.where("? >= start_date and ? <= end_date", current_date, current_date).last
    return true if !current_boycott.nil? && current_boycott.gas_stations.include?(self)
    current_boycott_by_distributor = BoycottDistributor.where("? >= start_date and ? <= end_date", current_date, current_date).last
    return true if !current_boycott_by_distributor.nil? && current_boycott_by_distributor.gas_stations.include?(self)
    return false
  end
end
