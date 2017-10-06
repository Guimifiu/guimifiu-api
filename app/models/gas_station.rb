class GasStation < ApplicationRecord
  has_many :price_suggestions
  has_many :users_price_suggestions, through: :price_suggestions, class_name: 'User'

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
end
