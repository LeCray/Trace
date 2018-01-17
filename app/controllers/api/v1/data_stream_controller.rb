module Api
	module V1
		class DataStreamController < ApplicationController
			include SessionsHelper
			skip_before_action :verify_authenticity_token
			
		

			def data_stream	
				email  		= params[:email]
				obd2Data 	= params[:obd2Data]

				

			end

		end
	end
end


