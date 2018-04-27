module Api
	module V1
		class MobileSignUpController < ApplicationController
			include SessionsHelper
			skip_before_action :verify_authenticity_token
			before_action :verify_params
		

			def sign_up
				first_name 				= params[:first_name]
				last_name 				= params[:last_name]
				email  					= params[:email]
				tel 					= params[:tel]
				password    			= params[:password]
				password_confirmation 	= params[:password_confirmation]

				@driver = Driver.new(first_name: first_name, last_name: last_name, 
									email: email, tel: tel, password: password, 
									password_confirmation: password_confirmation)
		
				if @driver.save
		      		render json: {signUp: "Successfull"}
				else
					render json: {signUp: "Unsuccessfull"}
				end				
			end

			def verify_params
				if !params[:email] || !params[:password]
					render json: {Error: "No params"}
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


