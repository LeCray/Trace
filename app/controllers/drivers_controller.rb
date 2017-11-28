class DriversController < ApplicationController

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

		@car = Car.new
		@invoice = Invoice.new
	end

private

	def driver_params
		params.require(:driver).permit(:first_name, :last_name, :id_number)
	end


end
