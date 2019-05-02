# frozen_string_literal: true

class ContractsController < ApplicationController
  def new
    @contract = Contract.new
    @location = find_location
    if params[:tenant_id]
      @tenant = @location.tenants.find(params[:tenant_id])
      @units = @location.units
    else
      @unit = @location.units.find(params[:unit_id])
      @tenants = @location.tenants
    end
  end

  def create
    contract = find_location.contracts.new contract_params
    contract.charge = contract.unit.price
    if contract.save
      contract.update_status
      redirect_to default_location_due_url(location_id: contract.unit.location_id, id: contract.id)
    else
      error_and_redirect contract, location_url(id: params[:location_id]), true
    end
  end

  def edit
    @contract = find_location.contracts.find(params[:id])
  end

  def show
    @contract = find_location.contracts.find(params[:id])
  end

  def update
    contract = find_location.contracts.find(params[:id])
    if contract.update(contract_params)
      redirect_to tenant_url(contract.tenant_id),
                  notice: 'Contract successfully updated'
    else
      redirect_back(fallback_location: location_url(id: params[:location_id]))
      flash[:alert] = contract.errors.full_messages.join(' ')
    end
  end

  def destroy
    contract = find_location.contracts.find(params[:id])
    location = contract.unit.location
    destroy_and_redirect contract, "Contract",
                         location_url(location.id), true
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
