class TenantsController < ApplicationController

    def new
        @tenant = Tenant.new
        @location = Location.find(params[:location_id])
    end

    def create
        tenant = Tenant.new tenant_params
        tenant.location_id = params[:location_id]
        if tenant.save
            redirect_to tenant_path(tenant.id)
        else
            redirect_to new_location_tenant_path
            flash[:alert] = tenant.errors.full_messages.join(" ")
        end
    end

    def show
        @tenant = Tenant.find(params[:id])
        @contracts = Contract.where(id: @tenant.id)
    end

    private
    def tenant_params
        params.require(:tenant)
              .permit(:name, :location)
    end
end
