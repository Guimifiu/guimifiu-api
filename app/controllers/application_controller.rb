class ApplicationController < ActionController::API
  protect_from_forgery with: :null_session
  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      ApiUser.find_by(auth_token: token)
    end
  end
end