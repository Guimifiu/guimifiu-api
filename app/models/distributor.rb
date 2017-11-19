class Distributor < ApplicationRecord
  validates :name, uniqueness: true
  has_many :gas_stations
end
