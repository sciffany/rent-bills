# frozen_string_literal: true

class DuesController < ApplicationController
  # similar to new
  def default
    @contract = Contract.find(params[:id])
    @due = Due.new
  end

  def sched
    due = Due.new due_params
    due.contract_id = params[:contract_id]
    md = params[:monthly_date].to_i
    sd = Date.parse(params[:start_date])
    eda = Date.parse(params[:end_date])
    if (md && md > 28 or md < 1)
      redirect_back locations_url, alert: "Monthly date must be 1-28"
    elsif
      (sched = if sd.day < md
                sd.change(day: md)
              else
                sd.change(day: md) + 1.month
              end)
      schedule_duties_helper(sched, eda, due)
    end
  end

  def destroy
    due = Due.find(params[:id])
    destroy_and_redirect due, "Due", locations_url, true
  end

  private

  def schedule_duties_helper(sched, eda, due)
    if sched > eda
      redirect_to tenant_url(due.contract.tenant.id), notice: "Dues set successfully."
    else
      newdue = due.dup
      newdue.update(due_date: sched)
      newdue.save
      schedule_duties_helper(sched + 1.month, eda, due)
    end
  end

  def due_params
    params.require(:due).permit(:amount, :start_date, :remark)
  end
end
