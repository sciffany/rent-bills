# frozen_string_literal: true

class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    location = Location.new location_params
    location.user = current_user
    if location.save
      create_duty(location)
    else
      redirect_to new_location_path, alert: location.errors.full_messages.join
    end
  end

  def search
    @locations = if params[:name]
                   Location.all.where(name: params[:name])
                 else
                   Location.all
                 end
  end

  def index
    @locations = current_user.locations
  end

  def show
    redirect_to location_units_url(params[:id])
  end

  private

  def location_params
    params.require(:location)
          .permit(:name,
                  :password,
                  :password_confirmation)
  end

  def create_duty(location)
    Duty.create(keeper: current_user,
                location: location,
                start_date: Time.now,
                end_date: Time.now.next_year(10))
    redirect_to location_url(location.id)
  end
end
