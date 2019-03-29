# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new user_params
    if user.save
      redirect_to user_url(user.id)
    else
      redirect_to new_user_url
      flash[:alert] = user.errors.full_messages.join
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @duties = Duty.where(user_id: @user.id)
  end

  private

  def user_params
    params.require(:user)
          .permit(:name,
                  :email,
                  :password,
                  :password_confirmation,
                  :role)
  end
end
