class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :firstname, :lastname, presence: true
  has_secure_password     #authenticate, validate and password=
  has_many :pins
  has_many :destinations, through: :pin
end
