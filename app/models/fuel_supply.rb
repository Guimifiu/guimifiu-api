class FuelSupply < ApplicationRecord
  belongs_to :user
  belongs_to :gas_station

  def date
    self.created_at.strftime('%d/%m/%Y')
  end

  def gas_station_name
    self.gas_station.name
  end
end
