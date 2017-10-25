class Boycott < ApplicationRecord
    has_and_belongs_to_many :gas_stations

    def self.current_boycott
        today = DateTime.now.to_date
        boycott = Boycott.where('start_date <= ? AND end_date >= ?', today, today).first
        return boycott
    end
end
