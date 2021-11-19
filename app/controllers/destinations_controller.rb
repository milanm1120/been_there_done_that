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
            render :new
        end
    end

    def show
        @destination = Destination.find_by_id(params[:id])
    end

    def edit
        @destination = Destination.find_by_id(params[:id])
    end

    def update
        @destination = Destination.find_by_id(params[:id])
        @destination.update(destination_params)
        if @destination.valid?
            redirect_to destinations_path(@destination)
        else
            render :edit
        end
    end

    def destroy
        @destination = Destination.find_by_id(params[:id])
        @destination.destroy
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

end