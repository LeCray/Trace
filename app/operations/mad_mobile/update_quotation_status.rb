module MadMobile
	class UpdateQuotationStatus

		def initialize(email:, status:, quo_url:, quo_id:)
			@driver 		= Driver.find_by(email: email)
			@quotation 		= @driver.quotations.find(quo_id)
			@status			= status
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				@quotation.update(status: "#{@status}")

			end
		end

	end
end