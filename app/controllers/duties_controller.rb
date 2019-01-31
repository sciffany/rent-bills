class DutiesController < ApplicationController

    def new
        @duty = Duty.new
    end

    def create
        duty = Duty.new duty_params
        if duty.save
            redirect_to location_url(duty.location_id)
        else
            redirect_to new_duties_url
            flash[:alert] = duties.errors.full_messages.join()
        end
    end

    def index

    end

    def show
        
    end

    private
    def duty_params
        params.require(:duty)
              .permit(:start_date, :end_date, :user_id, :location_id)
    end
end
