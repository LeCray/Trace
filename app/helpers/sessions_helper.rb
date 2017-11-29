module SessionsHelper

	# Logs in the given admin.
	def admin_log_in(admin)
		session[:admin_id] = admin.id
	end

	# Logs out the current admin.
	def admin_log_out
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
	def admin_logged_in?
		!current_admin.nil?
	end



	# Logs in the given driver.
	def driver_log_in(driver)
		session[:driver_id] = driver.id
	end

	# Logs out the current driver.
	def driver_log_out
		session.delete(:driver_id)
		@current_driver = nil
	end

	# Returns the current logged-in driver (if any).
	def current_driver
		if (driver_id = session[:driver_id])
			@current_driver ||= Driver.find_by(id: driver_id)
		end
	end
  

   # Returns true if the driver is logged in, false otherwise.	
	def driver_logged_in?
		!current_driver.nil?
	end
end
