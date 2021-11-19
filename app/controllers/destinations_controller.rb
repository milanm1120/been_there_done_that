class DestinationsController < ApplicationController
    def index
        @destinations = Destination.all
        
    end

    def show
        @destination = Destination.find_by_id(params[:id])
    end

    def most_visited_country
        @destinations = Destination.order_country           #order_contry def'ed in models/destination.rb
        render :index
    end
end