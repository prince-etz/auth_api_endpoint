class RegistrationsController < ApplicationController
  skip_before_action :authenticate
  def users_registration
    registration = RegisterUser.call(params[:name], params[:email], params[:password])
    
    if registration 
      render json: { success: registration, status: 200, message: "successfully registered" }, status: 200
    else
      render json: { errors: "uprocessible entity" }, status: 422
    end
  end
end
