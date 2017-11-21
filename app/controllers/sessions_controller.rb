class SessionsController < ApplicationController
	include SessionsHelper
  
	def new
	end

	def create	
		admin = Admin.find_by(email: params[:session][:email])
		if admin && admin.authenticate(params[:session][:password])
			log_in admin
			redirect_to admins_path	
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new' 
		end
	end

	def destroy
	    log_out
	    redirect_to root_url
	 end

end


