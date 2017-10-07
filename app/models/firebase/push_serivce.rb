module Firebase
  class PushService
    require 'fcm'
    def send_message_to_everyone(message)
      fcm = FCM.new("AAAA5pC3xng:APA91bHvoHNroFHDVv8-nxL8MN2E7K9BoTvgHiUNYQcQifkBve_LSQY8xkg7o69B1Xdz676DGoooNBrW9NRWSjXQ71XvP6P22h1yBFtdeV3rErk0oZFBHiUJNN3CcYvt2j5ZMyMjGJAB")
      # you can set option parameters in here
      #  - all options are pass to HTTParty method arguments
      #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L29-L60
      #  fcm = FCM.new("my_server_key", timeout: 3)

      registration_ids= ["1"] # an array of one or more client registration tokens
      options = {data: {score: "123"}, collapse_key: "updated_score"}
      response = fcm.send(registration_ids, options)
    end
  end
end
