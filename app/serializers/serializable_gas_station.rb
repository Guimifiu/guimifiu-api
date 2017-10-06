class SerializableGasStation < JSONAPI::Serializable::Resource
  type 'gas_stations'

  attributes :latitude, :longitude, :google_maps_id, :vicinity,
    :name, :gas_price, :alcohol_price, :diesel_price

  # attribute :date do
  #   @object.created_at
  # end

  has_many :price_suggestions
  has_many :fuel_supplies

  # has_many :comments do
  #   data do
  #     @object.published_comments
  #   end

    # link :related do
    #   @url_helpers.user_posts_url(@object.id)
    # end

    # meta do
    #   { count: @object.published_comments.count }
    # end
  # end

  # link :self do
  #   @url_helpers.post_url(@object.id)
  # end
  #
  # meta do
  #   { featured: true }
  # end
end
