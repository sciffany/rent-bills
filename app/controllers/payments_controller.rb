# frozen_string_literal: true

class PaymentsController < ApplicationController
  def index; end

  def new; end

  def create
    payment = Payment.new payment_params
    payment.tenant = Tenant.find(params[:payment][:tenant_id])
    payment.user = current_user
    payment.status = :unverified
    if payment.save
      redirect_to location_url(payment.tenant.location_id, tab: 'balance_tab')
      flash[:notice] = "Payment entry successfully created."
    else
      redirect_to location_url(payment.tenant.location_id, tab: 'balance_tab')
      flash[:alert] = payment.errors.full_messages.join(' ')
    end
  end

  def destroy
    payment = Payment.find(params[:id])
    location_id = payment.tenant.location_id
    if payment.destroy
      redirect_to location_url(id: location_id, tab: "balance_tab")
      flash[:notice] = "Payment entry successfully deleted."
    end
  end

  def show
  end

  def update
    payment = Payment.find(params[:id])
    if params[:s] == 'd' 
      payment.status = :declined;
    else
      payment.status = :accepted;
    end
    if payment.save
      redirect_to location_url(id: payment.tenant.location_id, tab: "balance_tab")
      flash[:notice] = "Payment verified."
    end
  end

  private

  def payment_params
    params.require(:payment)
          .permit(:pay_date, :tenant, :amount, :remark)
  end

  def show; end
end
