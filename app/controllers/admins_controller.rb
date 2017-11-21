class AdminsController < ApplicationController


	def index
	end

	def show
	end

	def new
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(admin_params)
		

		if @admin.save!
      		flash.now[:info] = "Success"
      		AdminMailer.account_activation(@admin).deliver_now
      		flash.now[:info] = "An activation link has been sent to your email address"
      		render new_admin_path
		else
			render 'new'
		end
	end


	private

	def admin_params
		params.require(:admin).permit(:first_name, :last_name, :email,:password, :password_confirmation, :role)
	end


	def format_name
		self.first_name = self.first_name.capitalize
		self.last_name = self.last_name.capitalize
	end

	def format_role
		self.role = self.role.capitalize
	end
end
