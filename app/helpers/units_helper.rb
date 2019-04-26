# frozen_string_literal: true

module UnitsHelper
  def verify_duty
    unless v_locations.map { |x| x.id.to_i }.include? params[:location_id].to_i
      redirect_back_or_to locations_search_url, alert: 'You are not a verified keeper for that location.'
    end
  end
end
