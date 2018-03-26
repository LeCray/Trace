module MadMobile
	class CancelBooking

		def initialize(email:)
			@driver 		= Driver.find_by(email: email)
			@booking 		= @driver.booking
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@booking.destroy

			end


			fcm = FCM.new("AIzaSyDYgJqxuPWXdMXaafO2TR7qTwYWNLGlick")
			
			registration_ids= ["#{@driver.fcm_token}"] # an array of one or more client registration tokens

			options = {
				priority: "high",
				collapse_key: "updated_score", 
				notification: {
					title: "M.A.D Booking Cancelled", 
					body: "Your vehicle booking has been cancelled",
					icon: "ic_notif",
					sound: "default",

				}
			}

			response = fcm.send(registration_ids, options)

			
		end

	end
end
