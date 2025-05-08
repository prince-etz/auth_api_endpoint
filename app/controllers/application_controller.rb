class ApplicationController < ActionController::API
  before_action :authenticate

  attr_accessor :current_user

  def authenticate
    @currrent_user ||= AuthorizeUser.call(request.headers).result
    render json: { error: 'Not Authorized'}, status: 401 unless @current_user
  end
end
