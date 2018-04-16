module MadMobile
	class ConfirmBooking

		def initialize(email:)
			@driver 		= Driver.find_by(email: email)
			@booking		= @driver.booking
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@booking.update(status: "Confirmed")

			end


			fcm = FCM.new("AAAA8T5WqNA:APA91bGarHyiYG-vPJQSfyb2qjLdDml5dgX0x5Qrdt-IKnVd54Rfe7cWHdJ6N0Hk5m5H_xGLJ4I0NrOgQajQb9rysiyjpG-L8hlVcWQxMnMp8ajT2i9k1gxgXOBWg_LpE61LL8jE2Nho")
			
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