# frozen_string_literal: true

require 'application_helper.rb'

class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    elsif user
      refresh_with_error('Incorrect password')
    else
      refresh_with_error('Email not found in our database')
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def refresh_with_error(msg)
    flash[:alert] = msg
    render 'new'
  end

  private

  def session_params
    params.require(:user)
          .permit(:email, :password)
  end
end
