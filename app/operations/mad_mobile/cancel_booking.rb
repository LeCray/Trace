module MadMobile
	class CancelBooking

		def initialize(email:, date:)
			@driver 		= Driver.find_by(email: email)
			@booking 		= @driver.bookings.find(date: date)

		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@booking.update(status: "Cancel")

			end
			
		end

	end
end