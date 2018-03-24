module MadMobile
	class NewBooking

		def initialize(email:, date:, time:, description:, make:, model:, status:)
			@driver 		= Driver.find_by(email: email)
			@date 			= date
			@time 			= time
			@description 	= description
			@make 			= make
			@model 			= model
			@status 		= status
		end

		def execute!
			ActiveRecord::Base.transaction do

				@booking = @driver.build_booking(
					date: @date, time: @time, make: @make, 
					model: @model, description: @description, status: @status
				)
				
				@booking.save

			end
			
		end

	end
end