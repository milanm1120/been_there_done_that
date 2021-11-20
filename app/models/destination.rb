class Destination < ApplicationRecord
    validates :city, :country, presence: true               #validates is a class method produced from ActiveRecords
    has_many :pins
    # has_many :users, through: :pin

    def city_state_country
        "#{self.city}, #{self.state}, #{self.country }"
    end

    def self.order_country
        self.order(:country)
        # self.where()
    end
end
