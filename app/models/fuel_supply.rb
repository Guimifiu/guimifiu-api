class FuelSupply < ApplicationRecord
  belongs_to :user
  belongs_to :gas_station
  has_one :rating, dependent: :destroy

  enum fuel_type: {
    gas: 0,
    alcohol: 1,
    diesel: 2
  }

  def fuel_type_translated
    if self.fuel_type == 'gas'
      return 'Gasolina'
    elsif self.fuel_type == 'alcohol'
      return 'Álcool'
    elsif self.fuel_type == 'diesel'
      return 'Diesel'
    end
  end

  def date
    self.created_at.strftime('%d/%m/%Y')
  end

  def gas_station_name
    self.gas_station.name
  end

  def gas_station_vicinity
    self.gas_station.vicinity
  end

  def gas_station_icon
    self.gas_station.icon
  end

  def rating_stars
    self.rating.nil? ? nil : self.rating.stars
  end

end
