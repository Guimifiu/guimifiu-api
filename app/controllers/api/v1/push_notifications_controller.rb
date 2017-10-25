class Api::V1::PushNotificationsController < ApiController

  def at_gas_station_notification
    user_device_token = params[:push_notification][:user_device_token]
    gas_station_id = params[:push_notification][:gas_station_id]
    gas_station = GasStation.find_by_id(gas_station_id)
    firebase = FirebasePushService.new
    firebase.send_notification_to_user(user_device_token, "Você está abastecendo?", gas_station.name)
  end
end
