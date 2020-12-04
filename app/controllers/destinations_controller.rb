class DestinationsController < ApplicationController
    before_action :find_destination, only: [:show, :edit, :update, :destroy]

    def index
        @destinations = Destination.all
    end
    
    def new
        @destination = Destination.new
    end

    def show
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.valid?
            @destination.save
            redirect_to destination_path(@destination)
        else
            redirect_to new_destination_path
        end
    end

    def edit

    end

    def update
        @test_destination = Destination.new(destination_params)
        if @test_destination.valid?
            @destination.update(destination_params)
        end
        redirect_to destination_path(@destination)
    end

    def destroy
    end

    private
    
    def find_destination
        @destination = Destination.find(params[:id])
    end

    def destination_params
        params.require(:destination).permit(:name, :country, :created_at, :updated_at)
    end
end
