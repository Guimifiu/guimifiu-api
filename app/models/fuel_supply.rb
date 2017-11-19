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
    if fuel_type == 'gas'
      return 'Gasolina'
    elsif fuel_type == 'alcohol'
      return 'Álcool'
    elsif fuel_type == 'diesel'
      return 'Diesel'
    end
  end

  def date
    created_at.strftime('%d/%m/%Y')
  end

  def gas_station_name
    gas_station.name
  end

  def gas_station_vicinity
    gas_station.vicinity
  end

  def gas_station_icon
    gas_station.icon
  end

  def rating_stars
    rating.nil? ? nil : rating.stars
  end

end
