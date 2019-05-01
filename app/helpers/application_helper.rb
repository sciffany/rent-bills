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

  def user_duties
    Duty.eager_load(:location, location: [:units,
                                          :tenants,
                                          :payments,
                                          { units: :contracts }]).where(user_id: current_user.id)
  end

  def v_locations
    user_duties.where(verified: true).map(&:location)
  end

  def uv_locations
    user_duties.where(verified: false).map(&:location)
  end

  def verify_duty
    unless v_locations.map { |x| x.id.to_i }.include? params[:location_id].to_i
      redirect_back_or_to locations_search_url, alert: 'You are not a verified keeper for that location.'
    end
  end
end
