# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    user = User.new user_params
    if user.save
      log_in(user)
      redirect_to root_path
    else
      redirect_to new_user_url
      flash[:alert] = user.errors.full_messages.join
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @duties = @user.duties
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
