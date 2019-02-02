# frozen_string_literal: true

class DutiesController < ApplicationController
  def new
    @duty = Duty.new
    @location = Location.find(params[:location_id])
    @current_user = current_user
  end

  def create
    duty = Duty.new duty_params
    duty.user_id = current_user.id
    duty.location_id = params[:location_id]
    if duty.save
      redirect_to user_url(current_user)
    else
      redirect_with_error
    end
  end

  def redirect_with_error
    redirect_to new_location_duty_url
    flash[:alert] = duty.errors.full_messages.join(', ')
  end

  def index; end

  def show
    @duty = Duty.find(params[:id])
  end

  private

  def duty_params
    params.require(:duty)
          .permit(:start_date, :end_date, :location_id)
  end
end
