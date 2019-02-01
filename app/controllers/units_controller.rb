class UnitsController < ApplicationController

    def index
        @units = Unit.where(location: params[:location_id])
    end

    def new
        @unit = Unit.new
        @location = Location.find(params[:location_id])
    end

    def create
        unit = Unit.new unit_params
        unit.location_id = params[:location_id]
        if unit.save
            redirect_to location_units_path(unit.location_id)
        else
            redirect_to new_location_duty_path
            flash[:alert] = unit.errors.full_messages.join(" ")
        end
    end

    private
    def unit_params
        params.require(:unit)
              .permit(:name, :price, :location)
    end
end
