class User < ApplicationRecord
  validates :name, :email, :password, presence: true, on: :create
  validates :email, uniqueness: true
  has_secure_password
end
