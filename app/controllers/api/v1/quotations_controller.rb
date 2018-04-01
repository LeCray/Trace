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

				@quotations.each do |q|
					quo_url.push(q.attachment_url)
					quo_date.push(q.created_at)
					quo_id.push(q.id)
				end

				quotations 	= []
				quotations.push(quo_url, quo_date, quo_id)
	
				render json: {quotations: quotations}						
			end  

			def update_quotation_status
				email 		= params[:email]
				quo_url  	= params[:quo_url]
				quo_id  	= params[:quo_id]
				status 		= params[:status]

				::MadMobile::UpdateQuotationStatus.new(
					email: 		email,
					quo_url:    quo_url,
					quo_id:    	quo_id,
					status: 	status
				).execute!
			end  	
				
		end
	end
end


