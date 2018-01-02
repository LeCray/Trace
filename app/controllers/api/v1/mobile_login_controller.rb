module Api
	module V1
		class MobileLoginController < ApplicationController
			include SessionsHelper
			skip_before_action :verify_authenticity_token
			before_action :verify_params
		

			def mobile_login	
				email  		= params[:email]
				password    = params[:password]

				admin = Admin.find_by(email: email)
				driver = Driver.find_by(email: email)

				

				if admin && admin.authenticate(password)
					admin_log_in admin
					render json: { 
						admin_authenticated: true, 
						first_name: admin.first_name 
					}
				elsif driver && driver.authenticate(password)
					driver_log_in driver
					render json: { 
						driver_authenticated: true,
					    first_name: admin.first_name  
					}
				else
					render json: {authenticated: false, email: email}
				end
			end

			def verify_params
				if !params[:email] || !params[:password]
					render json: {MSG: "No params"}
				end	
			end

			def authenticated?(attribute, token)
				digest = send("#{attribute}_digest")
				return false if digest.nil?
				BCrypt::Password.new(digest).is_password?(token)
			end

		end
	end
end


