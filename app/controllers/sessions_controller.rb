class SessionsController < ApplicationController
	include SessionsHelper
  
	def new
	end

	def create	
		admin = Admin.find_by(email: params[:session][:email])
		if admin && admin.authenticate(params[:session][:password])
			log_in admin
			redirect_to drivers_path
		else		
			redirect_to login_path , notice: "Incorrect Combination"	
		end
	end

	def destroy
	    log_out
	    redirect_to root_url
	 end

end


