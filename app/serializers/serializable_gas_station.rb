class SerializableGasStation < JSONAPI::Serializable::Resource
  type 'gas_stations'

  attributes :latitude, :longitude, :google_maps_id, :vicinity,
    :name, :gas_price, :alcohol_price, :diesel_price

  has_many :price_suggestions
  has_many :fuel_supplies

end
