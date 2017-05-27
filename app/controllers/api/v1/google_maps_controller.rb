class Api::V1::GoogleMapsController < ApplicationController
  def get_place_location
    google_maps = GoogleMaps.new
    params[:place_id]
    body = google_maps.get_place_location(params[:place_id])
    p body
    id = body['result']['place_id']
    name = body['result']['name']
    vicinity = body['result']['vicinity']
    latitude = body['result']['geometry']['location']['lat']
    longitude = body['result']['geometry']['location']['lng']
    p body['result']['geometry']
    p latitude
    p longitude
    place = {
      "id": id,
      "name": name,
      "vicinity": vicinity,
      "latitude": latitude,
      "longitude": longitude
    }
    render json: place, status: :ok
  end
end
