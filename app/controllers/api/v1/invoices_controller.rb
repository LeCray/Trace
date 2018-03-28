module Api
	module V1
		class InvoicesController < ApplicationController
			skip_before_action :verify_authenticity_token
		
		
			def get_invoices
				email 			= params[:email]

				@driver = Driver.find_by(email: email)
				@invoices = @driver.invoices.all

				invoices = []
				inv_url = []
				inv_date = []

				invoices.push(inv_url, inv_date)

				@invoices.each do |i|
					inv_url.push(i.attachment_url)
					inv_date.push(i.created_at)
				end
	

				render json: {invoices: invoices}						
			end    	
				
		end
	end
end


