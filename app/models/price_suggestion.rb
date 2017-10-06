class PriceSuggestion < ApplicationRecord
  belongs_to :user
  belongs_to :gas_station

  enum fuel_type: {
    gas: 0,
    alcohol: 1,
    diesel: 2
  }
end
