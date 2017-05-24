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

end
