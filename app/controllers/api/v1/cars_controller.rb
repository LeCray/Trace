module Api
	module V1
		class CarsController < ApplicationController
			skip_before_action :verify_authenticity_token
				
			def update_car_status	
				email 			= params[:email]
				vehicleReg 		= params[:vehicleReg]
				carStatus		= params[:carStatus]
	
				::MadMobile::UpdateCarStatus.new(
					email: 			email,
					vehicleReg: 	vehicleReg,
					carStatus: 		carStatus,
				).execute!	

				render json: {carStatus: carStatus}						
			end 

			def get_car_status
				email 		= params[:email]

				@driver = Driver.find_by(email: email)
				@cars   = @driver.cars

				carsArray 	= []
				vehicleReg 	= []
				carMake 	= []
				carModel 	= []
				carStatus 	= []

				@cars.each do |c|
					if c.status != "None" && c.status != nil
						vehicleReg.push(c.vehicle_reg)
						carMake.push(c.make)
						carModel.push(c.model)
						carStatus.push(c.status)
					end
				end

				carsArray.push(vehicleReg)
				carsArray.push(carMake)
				carsArray.push(carModel)
				carsArray.push(carStatus)

				render json: {carsArray: carsArray}
			end   

		end
	end
end


