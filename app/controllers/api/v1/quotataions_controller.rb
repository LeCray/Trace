module Api
	module V1
		class QuotationsController < ApplicationController
			skip_before_action :verify_authenticity_token
		
		
			def get_quotations
				email 			= params[:email]

				@driver = Driver.find_by(email: email)
				@quotations = @driver.quotations.all

				quotations = []
				quo_url = []
				quo_date = []

				quotations.push(quo_url, quo_date)

				@quotations.each do |q|
					quo_url.push(q.attachment_url)
					quo_date.push(q.created_at)
				end
	

				render json: {quotations: quotations}						
			end    	
				
		end
	end
end


