class UsersController < ApplicationController

	def new
		@user = User.new

	end

	def create
		user = User.new user_params
		if user.save
			redirect_to users_url
		else
			redirect_to new_user_url
			flash[:alert] = user.errors.full_messages.join()
		end
	end

	def index
		@users = User.all
	end

	private
	def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation)
	end


end
