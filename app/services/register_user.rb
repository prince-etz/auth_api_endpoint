class RegisterUser < ApplicationService
  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end
  
  def call
    create_user
  end
  
  private
  
  attr_accessor :name, :email, :password
    
  def create_user
    User.create!(
      name: name,
      email: email,
      password: password
    )
    rescue ActiveRecord::RecordInvalid => e 
      e.message
  end
end