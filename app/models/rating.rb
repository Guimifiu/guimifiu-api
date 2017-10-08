class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :gas_station
  belongs_to :fuel_supply
end
