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
    Contract.contract_status if params[:refresh]
    @tab = params[:tab] if params[:tab]
    if(@tab=="pending_tab")
      @pending = current_user.watchedDuties.where(verified: false)
    else
      @locations = current_user.v_locations(true)
      @uv_locations = current_user.v_locations(false)
    end
  end

  def show
    params.permit(:tab, :id)
    redirect_to location_units_url(params[:id], tab: params[:tab])
  end

  private

  def location_params
    params.require(:location)
          .permit(:name,
                  :password,
                  :password_confirmation)
  end

  def create_duty(location)
    Duty.create(user: current_user,
                location: location,
                start_date: Time.now,
                end_date: Time.now.next_year(10),
                verified: true)
    redirect_to locations_url
  end
end
