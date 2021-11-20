class Pin < ApplicationRecord
  # belongs_to :user
  belongs_to :destination
  validates :rating, numericality: {greater_than: 0, less_than: 6}
  accepts_nested_attributes_for :destination                 #this marco gives us access to a method called 'destination_attributes='
end


