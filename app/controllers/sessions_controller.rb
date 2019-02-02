# frozen_string_literal: true

require 'application_helper.rb'

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    elsif user
      refresh_with_error('Incorrect password')
    else
      refresh_with_errore('Email not found in our database')
    end
  end

  def refresh_with_error(msg)
    flash[:alert] = msg
    render 'new'
  end

  def destroy; end

  private

  def session_params
    params.require(:user)
          .permit(:email, :password)
  end
end
