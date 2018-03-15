module MadMobile
	class ConfirmBooking

		def initialize(email:, date:)
			@driver 		= Driver.find_by(email: email)
			@date 			= @driver.bookings.find(date: date)
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@booking.udpdate(status: "Confirmed")

			end
			
		end

	end
end