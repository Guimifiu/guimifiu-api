class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :gas_station
end
