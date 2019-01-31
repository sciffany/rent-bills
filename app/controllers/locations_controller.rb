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
        @locations = Location.all
    end

    def show
        @location = Location.find(params[:id])
        @duties = Duty.where(location_id: @location.id)
        #if user there exists a contract which bonds this user and this location
        #then we want to let the user view all the tenants

    end
        
    private
    def location_params
        params.require(:location)
              .permit(:name)
    end
end
