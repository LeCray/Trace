class DriversController < ApplicationController
	include SessionsHelper
	before_action :check_if_admin, only: :index

	def index
		@drivers = Driver.all.order('created_at')
	end


	def new
		@driver = Driver.new
	end


	def create
		@driver = Driver.new(driver_params)
		

		if @driver.save!
      		flash.now[:info] = "Success"
      		redirect_to @driver
		else
			render 'new'
		end
	end


	def show
		@driver = Driver.find(params[:id])
		@cars = @driver.cars.all.order('created_at')
		@invoices = @driver.invoices.all.order('created_at').paginate(page: params[:page], per_page:10)

		@car = Car.new
		@invoice = Invoice.new
	end

private

	def driver_params
		params.require(:driver).permit(:first_name, :last_name, :email, :tel)
	end



	def check_if_admin
		if !admin_logged_in?
			redirect_to root_path
		end
	end
	

end
