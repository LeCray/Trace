module Api
	module V1
		class InvoicesController < ApplicationController
			skip_before_action :verify_authenticity_token
		
		
			def get_invoices
				email 			= params[:email]

				@driver = Driver.find_by(email: email)
				@invoices = @driver.invoices.all

				invoices = []

				@invoices.each do |i|
					invoices.push(i.attachment_url)
				end
	

				render json: {invoices: invoices}						
			end    	
				
		end
	end
end


