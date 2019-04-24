# frozen_string_literal: true

class PaymentsController < ApplicationController
  def index
    @location = location.find(id: params[:location_id])
    @payments = location.payments
  end

  def create
    payment = Payment.new payment_params
    payment.user = current_user
    if payment.save
      redirect_to location_url(payment.tenant.location_id)
    else
      redirect_to location_url(payment.tenant.location_id)
      flash[:alert] = payment.errors.full_messages.join(' ')
    end
  end

  def show

  end
end
