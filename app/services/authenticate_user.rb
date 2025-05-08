class AuthenticateUser < ApplicationService

  def initialize(email, password)
    @email = email
    @password = password
  end
  
  def call
    WebTokenGenerator.encode(user_id: user.id) if user
  end
  
  private
  
  attr_accessor :email, :password
  
  def user
    user = User.find_by(email: @email)
    return user && user.authenticate(password)
    errors.add(:invalid_credentials, "Invalid Credentials")
    nil
  end
end
