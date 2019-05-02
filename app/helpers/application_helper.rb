# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then 'alert alert-success alert-dismissible'
    when :alert then 'alert alert-danger alert-dismissible'
    end
  end

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
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

  def set_user_duties
    @user_duties = Duty.eager_load(:location,
                                   location: [:units,
                                              :tenants,
                                              :payments,
                                              { units: :contracts }])
                       .where(user_id: @current_user.id)
    @v_locations = @user_duties.where(verified: true).map(&:location)
  end

  def v_locations
    @user_duties.where(verified: true).map(&:location)
  end

  def find_location
    puts "start"
    @user_duties.each do |d|
      puts d.location.name
    end
    puts "stop"
    @user_duties.find_by(location_id: params[:location_id]).location
  end

  def uv_locations
    @user_duties.where(verified: false).map(&:location)
  end

  def verify_duty
    unless v_locations.map { |x| x.id.to_i }.include? params[:location_id].to_i
      redirect_back_or_to locations_search_url, alert: 'You are not a verified keeper for that location.'
    end
  end

  def destroy_and_redirect (object, object_name, link, back)
    link = request.referer || link if back
    if object.destroy
      redirect_to link, notice: "#{object_name} successfully deleted"
    else
      redirect_to link, alert: "#{object_name} cannot be deleted"
    end
  end

  def error_and_redirect_back (object, link)
    redirect_back_or_to link, alert: object.errors.full_messages.join(', ')
  end

end
