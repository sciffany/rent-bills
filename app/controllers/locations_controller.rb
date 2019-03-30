# frozen_string_literal: true

class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    location = Location.new location_params
    location.user = current_user
    if location.save
      redirect_to locations_path
    else
      redirect_to new_location_path
      flash[:alert] = location.errors.full_messages.join
    end
  end

  def index
    if params[:name]
      @locations = Location.all.where(name: params[:name])
    else 
      @locations = Location.none
    end
  end

  def show
    redirect_to location_units_url(params[:id])
    # @location = Location.find(params[:id])
    # @duties = Duty.where(location_id: @location.id)
  end

  private

  def location_params
    params.require(:location)
          .permit(:name)
  end
end
