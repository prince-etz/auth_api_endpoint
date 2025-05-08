class UsersController < ApplicationController
  skip_before_action :authenticate
  def authenticate_user
    user_token = AuthenticateUser.call(params[:email], params[:password])
  
    if user_token
      render json: { status: 200, token: user_token , message: "signed in"}
    else
      render json: { error: "failed login"}, status: :unauthorized
    end
  end

  def logout
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
  