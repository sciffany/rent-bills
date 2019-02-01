class TenantsController < ApplicationController

    def new
        @tenant = Tenant.new
    end

    def create
        tenant = Tenant.new tenant_params
        if tenant.save
            redirect_to location_units_url()
        else
            redirect_to new_location_duty_path
            flash[:alert] = unit.errors.full_messages.join(" ")
        end
    end

    private
    def tenant_params
        params.require(:unit)
              .permit(:name)
    end
end
