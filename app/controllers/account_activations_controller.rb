class AccountActivationsController < ApplicationController

	def edit
		admin = Admin.find_by(email: params[:email])
		if admin && (!admin.activated? || admin.activated.nil?) && admin.authenticated?(:activation, params[:id])
			admin.update_attribute(:activated, true)
			admin.update_attribute(:activated_at, Time.zone.now)																																																																																																																																		
			log_in admin
			redirect_to admins_path
			flash.now[:success] = "Your account is now active."
		else
		flash[:danger] = "Invalid activation link"
		redirect_to new_admin_path
		end
	end
end
