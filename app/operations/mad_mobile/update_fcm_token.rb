module MadMobile
	class UpdateFCMToken

		def initialize(email:, fcm_token:)
			@driver 		= Driver.find_by(email: email)
			@fcm_token		= fcm_token
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@driver.update(fcm_token: @fcm_token)

			end
		end

	end
end