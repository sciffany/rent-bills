# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper

  before_action :authenticate_user

  def authenticate_user
    set_current_user
    if @current_user.nil?
      redirect_to sessions_new_url
    else
      set_user_duties
    end
  end

  def authenticate_non_user
    set_current_user
    redirect_to locations_url unless @current_user.nil?
  end

  end
