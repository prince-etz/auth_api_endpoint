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

  def show
    user = User.find(params[:id])
    render json: { status: 200, user: user } 
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: 'Not Found '}, status: :not_found
  end

  def update_details
    user = User.find(params[:id])
    user.update(user_params)
    render json: { status: 200, message: "successfully updated", user: user}
  rescue ActiveRecord::RecordInvalid => e 
    render json: { error: "Unable to update"}, status: :unprocessible_entity
  end

  def logout
    render json: { message: "Logged out successfully" }, status: :ok
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
  