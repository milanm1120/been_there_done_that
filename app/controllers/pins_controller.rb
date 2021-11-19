class PinsController < ApplicationController

    def index
        @pins = Pin.all 
    end

    def new
        @pin = Pin.new
    end

    def create
        @pin = Pin.new(pin_params)
        if @pin.save
            redirect_to pins_path
        else
            render :new
        end
    end

    def show
        find_pin
    end

    def edit
        find_pin
    end

    def update
        find_pin
        @pin.update(pin_params)
        if @pin.valid?
            redirect_to pins_path(@pin)
        else
            render :edit
        end
    end

    def destroy
        find_pin
        @pin.destroy
            redirect_to pins_path
    end

    private
    def pin_params
        params.require(:pin).permit(:user_id, :destination_id, :rating)
    end

    def find_pin
        @pin = Pin.find_by_id(params[:id])
    end


end