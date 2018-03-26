module MadMobile
	class MobileCheckBooking

		def initialize(email:)
			@driver 		= Driver.find_by(email: email)
			@booking 		= @driver.booking
		end

		def execute!
			@booking
		end
	end
end