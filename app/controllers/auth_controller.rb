#
class AuthController < ApplicationController
  def login
    credentials = login_params
    user = User.find_by email: credentials[:email]
    if user && user.authenticate(credentials[:password])
      render json: { token: user.token }
    else
      head :bad_request
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.require(:credentials).permit(:email, :password)
  end

  def user_params
    params.require(:username, :email, :password, :first_name, :last_name, :token).permit(:avatar)
  end
end
