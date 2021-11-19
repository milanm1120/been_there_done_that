class Destination < ApplicationRecord
    has_many :pins
    has_many :users, through: :pin

    def city_state_country
        "#{self.city}, #{self.state}, #{self.country }"
    end

    def self.order_country
        self.order(:country)
        # self.where()
    end
end
