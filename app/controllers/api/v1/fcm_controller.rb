module Api
	module V1
		class FcmController < ApplicationController
			skip_before_action :verify_authenticity_token

			def update_fcm_token
				email 		= params[:email]
				fcm_token 	= params[:fcm_token]


				update_fcm_token = ::MadMobile::UpdateFCMToken.new(
					email: 		email,
					fcm_token: 	fcm_token
				).execute!

			end

		end
	end
end