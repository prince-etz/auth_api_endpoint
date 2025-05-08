class RegistrationsController < ApplicationController
  skip_before_action :authenticate
  def users_registration
    registration = RegisterUser.call(params[:name], params[:email], params[:password])
    
    if registration 
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(registration, each_serializer: UserSerializer),
        message: ['User created'],
        status: 200,
        type: 'Success'
      }
    else
      render json: { errors: "uprocessible entity" }, status: 422
    end
  end
end
