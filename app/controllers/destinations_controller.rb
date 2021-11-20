class DestinationsController < ApplicationController
    
    def index
        @destinations = Destination.all 
    end

    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.new(destination_params)            #will only allow the listed attributes(values) to be added to the key(destination)
        if @destination.save
            redirect_to destinations_path
        else
            render 'destinations/new'
        end
    end

    def show
        find_destination                                            #private method>>
    end

    def edit
        find_destination
    end

    def update
        find_destination
        @destination.update(destination_params)
        if @destination.valid?
            redirect_to destinations_path(@destination)
        else
            render 'destinatons/edit'
        end
    end

    def destroy
        find_destination
        @destination.destroy                                       #destroy removes all associated items assigned to the item
            redirect_to destinations_path
    end

    def most_visited_country
        @destinations = Destination.order_country           #order_contry def'ed in models/destination.rb
            render :index
    end



    private
        def destination_params
            params.require(:destination).permit(:city, :state, :country)
        end

        def find_destination
            @destination = Destination.find_by_id(params[:id])
        end

end