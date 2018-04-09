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

		end
	end
end


