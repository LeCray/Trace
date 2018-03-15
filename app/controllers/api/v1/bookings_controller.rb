module Api
	module V1
		class BookingsController < ApplicationController
			skip_before_action :verify_authenticity_token
		
		
			def new_booking	
				email 			= params[:email]
				date 			= params[:date]
				time 			= params[:time]
				description 	= params[:description]
				make 			= params[:carMake]
				model 			= params[:carModel]

				
				bookings = ::MadMobile::PlaceBooking.new(
					email: 			email,
					date: 			date,
					time:			time,
					description: 	description,
					make: 			make,
					model: 			model
				).execute!
				

				render json: { 
					#status: zar_transaction,
					#zar_balance: account_id
				}								
			end    

			def confirm_booking
				
			end

		end
	end
end


