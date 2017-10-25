class ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :null_session
  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      ApiUser.find_by(auth_token: token)
    end
  end
end
