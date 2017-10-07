class FuelSupply < ApplicationRecord
  belongs_to :user
  belongs_to :gas_station

  enum fuel_type: {
    gas: 0,
    alcohol: 1,
    diesel: 2
  }

  def date
    self.created_at.strftime('%d/%m/%Y')
  end

  def gas_station_name
    self.gas_station.name
  end
end
