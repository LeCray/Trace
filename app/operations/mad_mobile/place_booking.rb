module MadMobile
	class PlaceBooking

		def initialize(email:, date:, time:, description:, make:, model:)
			@driver 		= Driver.find_by(email: email)
			@date 			= date
			@time 			= time
			@description 	= description
			@make 			= make
			@model 			= model
		end

		def execute!
			ActiveRecord::Base.transaction do

				@booking = @driver.bookings.build(date: @date, time: @time, 
												make: @make, model: @model, 
												description: @description)
				@booking.save

			end
			
		end

	end
end