require 'fcm'
class FirebasePushService
  def initialize
    @fcm = FCM.new("AIzaSyBbZdQXec3JWJhsNCDvMBRjW2b9VEGkT4o")
  end
  def send_notification_to_user(user_token, title, body)
    registration_ids = [user_token] # an array of one or more client registration tokens
    options = {notification: {title: title, body: body}}
    response = @fcm.send(registration_ids, options)
  end
end

# fcm gem documentation
# https://github.com/spacialdb/fcm
# firebase documentation
#https://firebase.google.com/docs/cloud-messaging/server#response
