module MadMobile
	class UpdateCarStatus

		def initialize(email:, carStatus:, carID:)
			@driver 		= Driver.find_by(email: email)
			@car 			= @driver.car.find(:carID)
			@carStatus		= carStatus
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@car.update(status: carStatus)

			end
		end

	end
end