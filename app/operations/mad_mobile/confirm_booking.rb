module MadMobile
	class ConfirmBooking

		def initialize(email:, booking:)
			@driver 		= Driver.find_by(email: email)
			@booking		= @driver.bookings.last
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@booking.update(status: "Confirmed")

			end
			
		end

	end
end