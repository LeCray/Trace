class CarsController < ApplicationController

	def index
		@car = Car.all.order('created_at')
	end

	def show
		@car = Car.find(params[:id])
	end

	def new 
		@car = Car.new
	end

	def create
		@car = Car.new(car_params)

		if @car.save!
      		flash.now[:info] = "Success"
      		redirect_to @car
		else
			render 'new'
		end
	end

	private

	params.require(:car).permit(:driver_id)




end
