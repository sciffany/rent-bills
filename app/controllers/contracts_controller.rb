# frozen_string_literal: true

class ContractsController < ApplicationController
  def new
    @contract = Contract.new
    @location = Location.find(params[:location_id])
    if params[:tenant_id]
      @tenant = Tenant.find(params[:tenant_id])
      @units = @location.units
    end
    if params[:unit_id]
      @unit = Unit.find(params[:unit_id])
      @tenants = @location.tenants
    end
  end

  def create
    contract = Contract.new contract_params
    contract.charge = contract.unit.price
    if contract.save
      contract.update_status
      redirect_to location_url(contract.unit.location_id)
    else
      redirect_back(fallback_location: location_url(id: params[:location_id]))
      flash[:alert] = contract.errors.full_messages.join(' ')
    end
  end

  def edit
    @contract = Contract.find(params[:id])
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def update
    contract = Contract.find(params[:id])
    if contract.update(contract_params)
      redirect_to tenant_url(contract.tenant_id),
                  notice: 'Contract successfully updated'
    else
      redirect_back(fallback_location: location_url(id: params[:location_id]))
      flash[:alert] = contract.errors.full_messages.join(' ')
    end
  end

  def destroy
    contract = Contract.find(params[:id])
    if contract.destroy
      redirect_back_or_to locations_url, notice: "Contract successfully deleted"
    end
  end

  private

  def contract_params
    params.require(:contract)
          .permit(:name, :tenant_id,
                  :start_date, :end_date,
                  :schedule, :charge,
                  :comment, :unit_id, :status)
  end

  def show_error
    redirect_to new_tenant_contract_path(contract_id),
                alert: 'Failed to update contract:' +
                       contract.errors.full_messages.join(', ')
  end
end
