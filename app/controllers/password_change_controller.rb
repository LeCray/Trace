class PasswordChangeController < ApplicationController
	include SessionsHelper

	def new
	end

	def create
	end

	def admin_edit
		@admin = current_admin
	end

	def driver_edit
		@driver = current_driver
	end

	def admin_update
		@admin = current_admin
	 	if params[:admin][:password].empty? 
			@admin.errors.add(:password, "can't be empty")
		    render 'admin_edit'
		elsif @admin.update_attributes!(admin_params)          # Case (4)
				redirect_to drivers_path, notice: "Your password has been changed"
		else
		render 'edit'                                     # Case (2)
		end
	end

	def driver_update
		@driver = current_driver
	 	if params[:driver][:password].empty? 
			@driver.errors.add(:password, "can't be empty")
		    render 'driver_edit'
		elsif @driver.update_attributes!(driver_params)          # Case (4
				redirect_to @driver, notice: "You password has been changed"
		else
		render 'edit'                                     # Case (2)
		end
	end

private

	def admin_params
      params.require(:admin).permit(:password, :password_confirmation)
    end

	def driver_params
      params.require(:driver).permit(:password, :password_confirmation)
    end


end
