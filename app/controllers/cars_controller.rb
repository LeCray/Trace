class CarsController < ApplicationController

	def index
		@car = Car.all.order('created_at')
	end

	def show
		@car = Car.find(params[:id])
	end

	def new 
		@driver = Driver.find(params[:driver_id])
		@car = Car.new
	end

	def create
		@driver = Driver.find(params[:driver_id])
		@car = @driver.cars.build(car_params)

		if @car.save!
      		flash.now[:info] = "Success"
      		redirect_to @driver
		else
			render 'new'
		end
	end

	private

	def car_params
		params.require(:car).permit(:driver_id, :make, :model, :vehicle_reg)
	end




end