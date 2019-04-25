# frozen_string_literal: true

module ApplicationHelper

  def flash_class(level)
    case level
    when :notice then 'alert alert-success alert-dismissible'
    when :alert then 'alert alert-danger alert-dismissible'
    end
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

  def redirect_back_or_to(link, alert: nil, notice: nil)
    redirect_to(request.referer || link, notice: notice, alert: alert)
  end
  
end
