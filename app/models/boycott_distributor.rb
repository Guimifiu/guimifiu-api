class BoycottDistributor < ApplicationRecord
    validate :check_boycott_existence

    belongs_to :distributor

    private
    def check_boycott_existence
        if Boycott.boycott_existense(self.start_date, self.end_date)
            errors.add(:data_do_boicote, ': Já existe um boicote por postos em andamento neste período')
        end
    end

end
