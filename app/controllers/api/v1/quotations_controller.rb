module Api
	module V1
		class QuotationsController < ApplicationController
			skip_before_action :verify_authenticity_token
		
		
			def get_quotations
				email 			= params[:email]

				@driver = Driver.find_by(email: email)
				@quotations = @driver.quotations.all

				quo_url 	= []
				quo_date 	= []
				quo_id 		= []
				quo_status 	= []

				@quotations.each do |q|
					quo_url.push(q.attachment_url)
					quo_date.push(q.created_at)
					quo_id.push(q.id)
					quo_status.push(q.status)
				end

				quotations 	= []
				quotations.push(quo_url, quo_date, quo_id, quo_status)
	
				render json: {quotations: quotations}						
			end  

			def update_quotation_status
				email 		= params[:email]
				quo_id  	= params[:quo_id]
				status 		= params[:quo_status]

				::MadMobile::UpdateQuotationStatus.new(
					email: 			email,
					quo_id:    		quo_id,
					quo_status: 	status
				).execute!
			end  	
				
		end
	end
end


