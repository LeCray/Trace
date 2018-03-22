module MadMobile
	class ConfirmBooking

		require 'fcm'

		def initialize(email:)
			@driver 		= Driver.find_by(email: email)
			@booking		= @driver.bookings.last
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@booking.update(status: "Confirmed")

			end



			fcm = FCM.new("AIzaSyDYgJqxuPWXdMXaafO2TR7qTwYWNLGlick")
			
			registration_ids= ["#{@driver.fcm_token}"] # an array of one or more client registration tokens

			options = {
				priority: "high",
				collapse_key: "updated_score", 
				notification: {
					title: "M.A.D Booking Confirmed", 
					body: "Your vehicle booking has been confirmed",
					icon: "ic_notif",
					sound: "default",

				}
			}

			response = fcm.send(registration_ids, options)
		end

	end
end