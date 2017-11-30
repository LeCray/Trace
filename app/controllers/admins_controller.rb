class AdminsController < ApplicationController
	include SessionsHelper

	def index
	end

	def show
	end

	def new
		@admin = Admin.new
		@driver = Driver.new
	end

	def create
		@admin = Admin.new(admin_params)
		
		if @admin.role == "Admin"
			if @admin.save!
	      		flash.now[:success] = "Admin has been created"
	      		#AdminMailer.account_activation(@admin).deliver_now
	      		render new_admin_path
			else
				render 'new'
			end

		elsif @admin.role == "Driver"
			@driver = Driver.new(driver_params)

			if @driver.save!
	      		flash.now[:info] = "Success"
	      		#AdminMailer.account_activation(@admin).deliver_now
	      		#flash.now[:info] = "An activation link has been sent their email address"
	      		redirect_to drivers_path
			else
				render 'new'
			end
		end
	end


	private

	def admin_params
		params.require(:admin).permit(:first_name, :last_name, :email, :tel, :password, :password_confirmation, :role)
	end

	def driver_params
		params.require(:admin).permit(:first_name, :last_name, :email, :tel, :password, :password_confirmation)
	end


	def format_name
		self.first_name = self.first_name.capitalize
		self.last_name = self.last_name.capitalize
	end

	def format_role
		self.role = self.role.capitalize
	end
end
