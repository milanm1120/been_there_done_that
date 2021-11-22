class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  validates :rating, numericality: {greater_than: 0, less_than: 6}
  accepts_nested_attributes_for :destination                 #this marco gives us access to a method called 'destination_attributes='

  def destination_attributes=(hash_of_attributes)
    if !hash_of_attributes["city"].blank? && !hash_of_attributes["country"].blank?          #state is an optional entry
        self.destination = Destination.find_or_create_by(hash_of_attributes)
    end
  end


end