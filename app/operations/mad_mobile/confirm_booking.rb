module MadMobile
	class ConfirmBooking

		def initialize(email:, date:)
			@driver 		= Driver.find_by(email: email)
			@booking		= @driver.bookings.find(date: date)
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@booking.update(status: "Confirmed")

			end
			
		end

	end
end