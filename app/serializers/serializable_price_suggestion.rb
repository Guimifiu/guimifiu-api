class SerializablePriceSuggestion < JSONAPI::Serializable::Resource
  type 'gas_stations'

  attributes :fuel_type, :value

  belongs_to :user
  belongs_to :gas_station

end
