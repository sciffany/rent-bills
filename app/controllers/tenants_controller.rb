# frozen_string_literal: true

class TenantsController < ApplicationController
  def new
    @tenant = Tenant.new
    @location = Location.find(params[:location_id])
  end

  def create
    tenant = Tenant.new tenant_params
    tenant.location_id = params[:location_id]
    if tenant.save
      redirect_to tenant_url(tenant.id)
    else
      redirect_to new_location_tenant_path
      flash[:alert] = tenant.errors.full_messages.join(' ')
    end
  end

  def destroy
    tenant = Tenant.find(params[:id])
    location_id = tenant.location_id
    destroy_and_redirect tenant, "Tenant", location_url(location_id), false
  end

  def index
    @location = Location.find(params[:location_id])
    @tenants = @location.tenants
  end

  def show
    @tenant = Tenant.find(params[:id])
    @payments = @tenant.payments.order(id: :asc)
    @dues = @tenant.dues.where('due_date<?', Time.now + 1.month)
    @sum = pay_due_sum @payments, @dues
  end

  private

  def tenant_params
    params.require(:tenant)
          .permit(:name, :location)
  end
end
