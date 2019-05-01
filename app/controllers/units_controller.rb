# frozen_string_literal: true

class UnitsController < ApplicationController
  before_action :verify_duty

  def index
    puts 'Here'
    @tab = params[:tab] if params[:tab]
    @location = Location.includes(:duties, :user).find(params[:location_id])
    @duties = @location.duties
    @location_owner = @location.user
    puts 'contract'
    @active_contracts_count = @location.contracts.where(status: :active).group('contracts.unit_id').count
    puts 'contract2'
    @tenants = @location.tenants
    @units = @location.units
    @payments = @location.payments.order(id: :asc)
    @dues = @location.dues.where('due_date<?', Time.now + 1.month)
    @sum = @payments.where(status: :accepted).sum(:amount) +
           @payments.where(status: :unverified).sum(:amount) -
           @dues.sum(:amount)

    puts 'There'
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
