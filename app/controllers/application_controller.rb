# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper

  before_action :authenticate_user
  
  def authenticate_user
    if current_user==nil
      redirect_to sessions_new_url
    end
  end

  def authenticate_non_user
    if current_user!=nil
      redirect_to user_path(current_user.id)
    end
  end

end
