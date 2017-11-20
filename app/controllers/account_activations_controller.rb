class AccountActivationsController < ApplicationController

	def edit
		admin = Admin.find_by(email: params[:email])
		if admin && !admin.activated? && admin.authenticated?(:activation, params[:id])
			admin.update_attribute(:activated, true)
			admin.update_attribute(:activated_at, Time.zone.now)
			log_in admin
			flash.now[:success] = "Your account is now active."
			redirect_to admins_path
		else
		flash[:danger] = "Invalid activation link"
		redirect_to new_admin_path
		end
	end
end
