# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper

  before_action :authenticate_user

  def authenticate_user
    redirect_to sessions_new_url if current_user.nil?
  end

  def authenticate_non_user
    redirect_to user_path(current_user.id) unless current_user.nil?
  end
end
