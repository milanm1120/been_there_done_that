class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :firstname, :lastname, :password, presence: true
  has_secure_password
  has_many :pins
  has_many :destinations, through: :pin
end
