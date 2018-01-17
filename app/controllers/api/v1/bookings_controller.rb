module Api
	module V1
		class BookingsController < ApplicationController
			skip_before_action :verify_authenticity_token
		
		

			def get_bookings	
				email = params[:email]

				driver = Driver.find_by(email: email)

				b_date = []

				bookings = driver.bookings.all.order('created_at DESC')

				bookings.each do |b|
					b_date.push(b.date)
				end

				
				respond_to do |format|
					format.json { render :json => b_date }
				end
				

			end    

		end
	end
end


