module MadMobile
	class UpdateCarStatus

		def initialize(email:, carStatus:, vehicleReg:)
			@driver 		= Driver.find_by(email: email)
			@car 			= @driver.cars.find_by(vehicle_reg: vehicleReg)
			@carStatus		= carStatus
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@car.update(status: @carStatus)

			end
		end

	end
end