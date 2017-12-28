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
					
					render json: { admin_authenticated: true }
				elsif driver && driver.authenticate(password)
					
					render json: { driver_authenticated: true }
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


