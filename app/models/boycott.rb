class Boycott < ApplicationRecord
    has_and_belongs_to_many :gas_stations

    def self.boycott_existense(start_date, end_date)
        start_date_between = Boycott.where('? <= start_date AND ? >= start_date', start_date, end_date).first
        end_date_between = Boycott.where('? >= start_date AND ? <= end_date', start_date, start_date).first
        if start_date_between.nil? && end_date_between.nil?
            return false
        end
        return true
    end
end
