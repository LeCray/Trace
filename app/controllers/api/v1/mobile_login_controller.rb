module Api
	module V1
		class MobileLoginController < ApplicationController
			skip_before_action :verify_authenticity_token
			before_action :verify_params
		

			def mobile_login	
				email  		= params[:email]
				password    = params[:password]

				admin = Admin.find_by(email: email)
				driver = Driver.find_by(email: password)

				if admin && admin.authenticate(password)
					admin_log_in admin
					render json: { authenticated: true }
				elsif driver && driver.authenticate(password)
					driver_log_in driver
					render json: { authenticated: true }
				else
					render json: {authenticated: false, email: email}
				end
			end

			def verify_params
				if !params[:email]
					render json: {MSG: "No email"}
				end

					
			end

		end
	end
end


