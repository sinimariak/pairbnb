module ApplicationHelper

	# def current_user
	# 	#if user.id == session[:user_id]
	# 		@current_user ||= User.find(session[:user_id]) if session[:user_id]
			
	# 	#end
	# 	# @current_user
	# end

	def logged_in?
		!current_user.nil?
	end

end
