# frozen_string_literal: true

class DuesController < ApplicationController
  def new
    @contract = Contract.find(params[:id])
    @due = Due.new
  end
  
  def create
    due = Due.new
    if due.save
        redirect_to locations_url
    else
        redirect_back_or_to locations_url
    end
  end

  private

  def due_params
    params.require(:monthly_date)

  end
end
