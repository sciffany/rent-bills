# frozen_string_literal: true

class ContractsController < ApplicationController
  def new
    @contract = Contract.new
    @tenant = Tenant.find(params[:tenant_id])
    @units = @tenant.location.units
  end

  def create
    contract = Contract.new contract_params
    contract.tenant_id = params[:tenant_id]
    if contract.save
      redirect_to tenant_url(contract.tenant_id)
    else
      redirect_to new_tenant_contract_path
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
      show_error(contract.id)
    end
  end

  def destroy
    contract = Contract.find(params[:id])
    tenant_id = contract.tenant_id
    redirect_to tenant_url(tenant_id) if contract.destroy
  end

  private

  def contract_params
    params.require(:contract)
          .permit(:name,
                  :start_date, :end_date,
                  :schedule, :charge,
                  :comment, :unit_id)
  end

  def show_error
    redirect_to new_tenant_contract_path(contract_id),
                alert: 'Failed to update contract:' +
                       contract.errors.full_messages.join(', ')
  end
end
