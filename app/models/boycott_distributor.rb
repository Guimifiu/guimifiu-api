class BoycottDistributor < ApplicationRecord
    validate :check_boycott_existence

    belongs_to :distributor

    def self.boycott_existense(start_date, end_date)
        start_date_between = BoycottDistributor.where('? <= start_date AND ? >= start_date', start_date, end_date).first
        end_date_between = BoycottDistributor.where('? >= start_date AND ? <= end_date', start_date, start_date).first
        if start_date_between.nil? && end_date_between.nil?
            return false
        end
        return true
    end

    private
    def check_boycott_existence
        if Boycott.boycott_existense(self.start_date, self.end_date)
            errors.add(:data_do_boicote, ': Já existe um boicote por postos em andamento neste período')
        end
        if BoycottDistributor.boycott_existense(self.start_date, self.end_date)
            errors.add(:data_do_boicote, ': Já existe um boicote por bandeira em andamento neste período')
        end
    end
end
