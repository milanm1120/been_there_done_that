class DestinationsController < ApplicationController
    before_action :find_destination, only: [:show, :edit, :update, :destroy]
    
    def index
        @destinations = Destination.all 
    end

    def new
        @destination = Destination.new
        @destination.pins.build                 #build for a has_many relationship
    end

    def create
        @destination = Destination.new(destination_params)            #will only allow the listed attributes(values) to be added to the key(destination)
        if @destination.save
            redirect_to destinations_path
        else
            render :new
        end
    end

    def show                                            #private method>>
    end

    def edit
    end

    def update
        @destination.update(destination_params)
        if @destination.valid?
            redirect_to destinations_path(@destination)
        else
            render :edit
        end
    end

    def destroy
        @destination.destroy                                       #destroy removes all associated items assigned to the item
            redirect_to destinations_path
    end

    def most_visited_country
        @destinations = Destination.order_country           #order_contry def'ed in models/destination.rb
            render :index
    end



    private
        def destination_params
            params.require(:destination).permit(:city, :state, :country, pins_attributes: [:rating])
        end

        def find_destination
            @destination = Destination.find_by_id(params[:id])
        end

end