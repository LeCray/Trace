module MadMobile
	class UpdateQuotationStatus

		def initialize(email:, quo_status:, quo_id:)
			@driver 		= Driver.find_by(email: email)
			@quotation 		= @driver.quotations.find(quo_id)
			@quo_status		= quo_status
		end

		def execute!
			ActiveRecord::Base.transaction do
				
				if @quo_status == "approved"
					@quotation.update(status: "Approved")
				else 
					@quotation.update(status: "Disapproved")
				end

			end
		end

	end
end