class GoogleMaps
  include HTTParty
  base_uri 'https://maps.googleapis.com/maps/api'

  def initialize()
    @key = 'AIzaSyBsMEtGmcIXdAuCWHe_truVedRSX2KFcAI'
  end

  def get_gas_stations(latitude, longitude, radius)
    url = "/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=#{radius}&type=gas_station&key=#{@key}"
    response = self.class.get(url)
    body = JSON.parse response.body.encode("ASCII",{undef: :replace,replace: ''})
    return body['results']
  end

  def get_place_location(place_id)
    url = "/place/details/json?placeid=#{place_id}&key=#{@key}"
    response = self.class.get(url)
    body = JSON.parse response.body.encode("ASCII",{undef: :replace,replace: ''})
    return body
  end

  def get_direction(origin, destination)
    url = "/directions/json?origin=#{origin}&destination=#{destination}&key=#{@key}"
    response = self.class.get(url)
    body = JSON.parse response.body.encode("ASCII",{undef: :replace,replace: ''})
    return body
  end

end
