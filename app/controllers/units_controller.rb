# frozen_string_literal: true

include UnitsHelper

class UnitsController < ApplicationController
  before_action :verify_duty

  def index
    @tab = params[:tab] if params[:tab]
    @location = Location.find(params[:location_id])
    @active_contracts_count = Contract.where(status: :active).group('contracts.unit_id').count
    @tenants = @location.tenants
    @units = @location.units
    @payments = @location.payments.order(id: :asc)
    @sum = @payments.sum(:amount)
    @dues = @location.dues
  end

  def new
    @unit = Unit.new
    @location = Location.find(params[:location_id])
  end

  def destroy
    unit = Unit.find(params[:id])
    location_id = unit.location_id
    if unit.destroy
      redirect_to location_url(location_id), notice: 'Unit successfully deleted'
    end
  end

  def create
    unit = Unit.new unit_params
    unit.location_id = params[:location_id]
    if unit.save
      redirect_to location_units_path(unit.location_id)
    else
      redirect_to new_location_unit_path
      flash[:alert] = unit.errors.full_messages.join(' ')
    end
  end

  def show
    @unit = Unit.find(params[:id])
    @contracts = @unit.contracts
  end

  private

  def unit_params
    params.require(:unit)
          .permit(:name, :price, :location)
  end
end
