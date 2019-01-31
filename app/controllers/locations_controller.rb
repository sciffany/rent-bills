class LocationsController < ApplicationController

    def new
        @location = Location.new
    end

    def create
        location = Location.new location_params
        if location.save
            redirect_to users_url
        else
            redirect_to new_locations_url
            flash[:alert] = location.errors.full_messages.join()
        end
    end

    def index
    end

    def show
        location = Location.find(params[:id])
    end
        
    private
    def location_params
        params.require(:location)
              .permit(:name)
    end
end
