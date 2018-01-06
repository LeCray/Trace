module Api
	module V1
		class BookingsController < ApplicationController
			skip_before_action :verify_authenticity_token
		
		

			def get_bookings	

				render json: {get_bookings: true}

			end

		end
	end
end


