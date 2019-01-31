# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then 'alert alert-success alert-dismissible'
    when :alert then 'alert alert-danger alert-dismissible'
    end
  end

 	def current_user
	  if session[:user_id]
	    User.find_by(id: session[:user_id])
	  end
  end
  
  def log_in(user)
		session[:user_id] = user.id
	end

end