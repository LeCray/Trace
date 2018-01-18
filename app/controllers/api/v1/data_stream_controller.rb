module Api
	module V1
		class DataStreamController < ApplicationController
			include SessionsHelper
			skip_before_action :verify_authenticity_token
			
		

			def data_stream	
				email  					= params[:email]
				speed 					= params[:SPEED] 
		        engine_rpm 				= params[:ENGINE_RPM]
=begin
		        engine_runtime 			= params[:ENGINE_RUNTIME]
		        fuel_level	 			= params[:FUEL_LEVEL] 
		        fuel_consumption_rate	= params[:FUEL_CONSUMPTION_RATE] 
		        throttle_pos 			= params[:THROTTLE_POS] 
		        air_fuel_ratio 			= params[:AIR_FUEL_RATIO] 
		        engine_oil_temp 		= params[:ENGINE_OIL_TEMP]
		        air_intake_temp 		= params[:AIR_INTAKE_TEMP]
		        dtc_number 				= params[:DTC_NUMBER]
=end
		       

				ActionCable.server.broadcast 'data_stream_channel',
                          	SPEED: 					speed,
                          	ENGINE_RPM: 			engine_rpm
=begin
					        ENGINE_RUNTIME: 		engine_runtime,
					        FUEL_LEVEL:	 			fuel_level,
					        FUEL_CONSUMPTION_RATE:	fuel_consumption_rate, 
					        THROTTLE_POS: 			throttle_pos,
					        AIR_FUEL_RATIO: 		air_fuel_ratio,
					        ENGINE_OIL_TEMP: 		engine_oil_temp,
					        AIR_INTAKE_TEMP: 		air_intake_temp,
					        DTC_NUMBER: 			dtc_number
=end
							head :ok		

			end

		end
	end
end


