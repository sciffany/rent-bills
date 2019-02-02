# frozen_string_literal: true

class ContractsController < ApplicationController
  def new
    @contract = Contract.new
    @tenant = Tenant.find(params[:tenant_id])
    @units = @contract.location.units
  end

  def create
    contract = Contract.new contract_params
    contract.tenant_id = params[:tenant_id]
    if contract.save
      redirect_to contract_path(contract.id)
    else
      redirect_to new_tenant_contract_path
      flash[:alert] = contract.errors.full_messages.join(' ')

    end
  end

  def show
    @contract = Contract.find(params[:id])
  end

  private

  def contract_params
    params.require(:contract)
          .permit(:name,
                  :start_date, :end_date,
                  :schedule, :charge,
                  :comment, :unit_id)
  end
end
