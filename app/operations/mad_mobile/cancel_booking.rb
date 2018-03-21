module MadMobile
	class CancelBooking

		def initialize(email:)
			@driver 		= Driver.find_by(email: email)
			@booking 		= @driver.bookings.last
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@booking.update(status: "Cancelled")

			end
			
		end

	end
end
