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
      redirect_to locations_url
    else
      redirect_back_or_to locations_url, alert: duty.errors.full_messages.join(', ')
    end
  end

  def edit
    @duty = Duty.find(params[:id])
  end

  def destroy
    duty = Duty.find(params[:id])
    redirect_to locations_url if duty.destroy
  end

  def update
    duty = Duty.find(params[:id])
    if duty.update(duty_params)
      redirect_to locations_url(tab: "pending-tab"),
                  notice: 'Contract successfully verified'
    else
      show_error(duty)
    end
  end

  def verify
    duty = Duty.find(params[:id])
    duty.verified = true
    if duty.update(duty_params_verify)
      redirect_to locations_url,
                  notice: 'Contract successfully updated'
    else
      redirect_to locations_url(tab: "pending_tab"), alert: duty.errors.full_messages.join(', ')
    end
  end

  def index; end

  def show
    @duty = Duty.find(params[:id])
  end

  private

  def duty_params_verify
    params.require(:duty)
          .permit(:location_id,
                  :end_date,
                  :start_date,
                  :verified)
  end

  def duty_params
    params.permit(:location_id, :user_id, :verified)
  end

  def show_error(duty)
    redirect_to edit_location_duty_url(duty.id),
                alert: 'Failed to update contract:' +
                       duty.errors.full_messages.join(', ')
  end
end
