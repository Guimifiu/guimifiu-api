class Api::V1::UsersController < ApiController

  before_action :search_user, only: [:search]
  before_action :set_user, only: [:update]

  def create
    @user = User.new(user_params)
    if @user.provider != 'email'
      @user.password = SecureRandom.hex
    end
    if @user.save
      render json: @user, status: :created
    else
      @user_response = User.find_by_email(@user.email)
      @response =
      {
        'message' => "Validation Failed",
        'errors' => @user.errors.full_messages,
        'user' => @user_response
      }
      render json: @response, status: :conflict
    end
  end

  def update
    if @user.update(user_params)
      @response = { "user": @user }
      render json: @response, status: :ok
    else
      @response =
      {
        "message": "Validation Failed",
        "errors": @user.errors.full_messages
      }
      render json: @response, status: :conflict
    end
  end

  def delete
    @user_email = params[:user][:email]
    @user = User.find_by_email(@user_email)
    if @user.present?
      if @user.destroy
        render json: @user, status: :ok
      else
        head :not_found
      end
    else
      head :not_found
    end
  end

  def sign_in
    @email = params[:user][:email]
    @password = params[:user][:password]
    @user = User.find_by_email(@email)
    if @user.present?
      if @user.valid_password?(@password)
        render json: @user, status: :ok
      else
        head :not_found
      end
    else
      head :not_found
    end
  end

  def search
    if @user.present?
      render json: @user, status: :ok
    else
      head :not_found
    end
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def set_user_with_user_id
    @user = User.find_by_id(params[:user_id])
  end

  def search_user
    @user = User.find_by_email(params[:email])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :surname, :document_number,
    :phone, :photo, :oauth_token, :oauth_expires_at, :uid, :device_token, :provider)
  end

end
