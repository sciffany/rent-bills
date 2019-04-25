# frozen_string_literal: true

class PaymentsController < ApplicationController
  def index
    @location = location.find(id: params[:location_id])
    @payments = location.payments
  end

  def new

  end

  def create
    payment = Payment.new payment_params
    payment.tenant = Tenant.find(params[:payment][:tenant_id])
    payment.user = current_user
    payment.verified = false
    if payment.save
      redirect_to location_url(payment.tenant.location_id)
    else
      redirect_to location_url(payment.tenant.location_id)
      flash[:alert] = payment.errors.full_messages.join(' ')
    end
  end

  private

  def payment_params
    params.require(:payment)
          .permit(:pay_date, :tenant, :amount)
  end

  def show

  end
end
