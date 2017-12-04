class PasswordResetController < ApplicationController
	def new
	end

	def create
		@driver = Driver.find_by(email: params[:password_reset][:email].downcase)
		if @driver
			@driver.create_reset_digest
			@driver.send_password_reset_email
		else
			
			redirect_to new_password_reset_path, notice: "Email not found"
		end
	end

	def edit
	end

end
