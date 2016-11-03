require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password

  validates :password, confirmation: { case_sensitive: false }
  validates :password_confirmation, presence: true

  has_many :trips
end
