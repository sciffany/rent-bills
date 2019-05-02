# frozen_string_literal: true

class PaymentsController < ApplicationController
  def index; end

  def new; end

  def create
    payment = Payment.new payment_params
    payment.user = @current_user
    payment.status = :unverified
    if payment.save
      redirect_to balance_tab_link,
        notice: 'Payment entry successfully created.'
    else
      error_and_redirect payment, balance_tab_link, false
    end
  end

  def destroy
    payment = Payment.find(params[:id])
    location_id = payment.tenant.location_id
    destroy_and_redirect payment, "Payment", 
                         location_url(id: location_id, tab: 'balance_tab'),
                         false
  end

  def show; end

  def update
    payment = Payment.find(params[:id])
    payment.status = if params[:s] == 'd'
                       :declined
                     else
                       :accepted
                     end
    if payment.save
      redirect_to location_url(id: payment.tenant.location_id, tab: 'balance_tab')
      flash[:notice] = 'Payment verified.'
    end
  end

  private

  def balance_tab_link
    location_url(params[:location_id], tab: 'balance_tab')
  end

  def payment_params
    params.require(:payment)
          .permit(:pay_date, :tenant_id, :amount, :remark)
  end
end
