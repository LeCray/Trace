module SessionsHelper

	# Logs in the given admin.
	def log_in(admin)
		session[:admin_id] = admin.id
	end

	# Logs out the current admin.
	def log_out
		session.delete(:admin_id)
		@current_admin = nil
	end

	# Returns the current logged-in admin (if any).
	def current_admin
		if (admin_id = session[:admin_id])
			@current_admin ||= Admin.find_by(id: admin_id)
		end
	end
  

   # Returns true if the admin is logged in, false otherwise.	
	def logged_in?
		!current_admin.nil?
	end
end
