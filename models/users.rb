require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true
  validates :gender, presence: true
  validates :age_group, presence: true
  validates :home_country, presence: true
  validates :email, confirmation: { case_sensitive: false }

  has_many :trips
end
