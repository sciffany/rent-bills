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
    cid = params[:contract_id].to_i
    sched = if sd.day < md
              sd.change(day: md)
            else
              sd.change(day: md) + 1.month
            end
    eda = Date.parse(params[:end_date])
    schedule_duties_helper(sched, eda, due)
  end

  def destroy
    due = Due.find(params[:id])
    location_id = due.contract.unit.location_id
    if due.destroy
      redirect_back_or_to locations_url
      flash[:notice] = 'Due entry successfully deleted.'
    end
  end

  private

  def schedule_duties_helper(sched, eda, due)
    if sched > eda
      redirect_to tenant_url(due.contract.tenant.id)
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
