require 'application_helper.rb'

class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    elsif user
      flash[:alert] = "Incorrect password"
      render 'new'
    else
    	flash[:alert] = "Email not found in our database"
      render 'new'
    end
  end

  def destroy
  end


  private
  def session_params
  	params.require(:user)
  				.permit(:email, :password)
  end
end
