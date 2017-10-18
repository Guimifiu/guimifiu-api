class Boycott < ApplicationRecord
    has_and_belongs_to_many :gas_stations
end
