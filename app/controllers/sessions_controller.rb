class SessionsController < ApplicationController
	include SessionsHelper
  
	def new
	end

	def create	
		admin = Admin.find_by(email: params[:session][:email])
		driver = Driver.find_by(email: params[:session][:email])

		if admin && admin.role == "Admin"
			admin_log_in admin
			redirect_to drivers_path
		elsif driver 
			driver_log_in driver
			redirect_to driver_path(driver.id)
		else
			redirect_to login_path , notice: "Incorrect Combination"	
		end
	end

	def destroy
		if admin_logged_in?
	    	admin_log_out
	    	redirect_to root_url
	    else
	    	driver_log_out
	    	redirect_to root_url
	    end
	 end

end


