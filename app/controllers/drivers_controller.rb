class DriversController < ApplicationController
	include SessionsHelper

	before_action :only_see_own_page, only: :show unless :admin?

	before_action :keep_drivers_out_of_index, only: :index

	def index
		@drivers = Driver.all.order(:first_name)
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
		@driverID = @driver.id

		
		@cars = @driver.cars.all.order('created_at DESC')
		@invoices = @driver.invoices.all.order('created_at DESC').paginate(page: params[:page], per_page:10)
		@quotations = @driver.quotations.all.order('created_at DESC').paginate(page: params[:page], per_page:10)
		@booking = @driver.booking

		@driver_email = @driver.email.to_json

		@car = Car.new
		@invoice = Invoice.new
		@quotation = Quotation.new
		@new_booking = Booking.new
	end

private

	def driver_params
		params.require(:driver).permit(:first_name, :last_name, :email, :tel)
	end



	def admin?
		admin_logged_in?
	end

	def only_see_own_page
	@driver = Driver.find(params[:id])
	  if current_driver != @driver 
	    redirect_to driver_path(current_driver.id)
	  end
	end

	def keep_drivers_out_of_index
		if driver_logged_in?
			redirect_to driver_path(current_driver.id)
		end
	end
	

end
