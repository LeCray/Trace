module Api
	module V1
		class MobileLoginController < ApplicationController
			skip_before_action :verify_authenticity_token
		

			def create	

			end

		end
	end
end


