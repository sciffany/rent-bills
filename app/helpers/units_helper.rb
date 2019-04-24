# frozen_string_literal: true

module UnitsHelper
  def verify_duty
      current_user.v_locations(true)
      if !current_user.v_locations(true).map{|x| x.id}.include? params[:location_id]
        redirect_back_or_to locations_search_url, alert: "You are not a verified keeper for that location."
      end
  end
end
