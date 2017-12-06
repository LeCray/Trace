class PasswordResetController < ApplicationController
	include SessionsHelper
	before_action :get_driver, only: [:edit, :update]
	before_action :valid_driver, only: [:edit, :update]
	before_action :check_expiration, only: [:edit, :update]    # Case (1)
    


	def new
	end

	def create
		@driver = Driver.find_by(email: params[:password_reset][:email].downcase)
		if @driver
			@driver.create_reset_digest
			
			DriverMailer.password_reset(@driver).deliver_now
			redirect_to new_password_reset_path, notice: "An email to reset your password has been sent"
		else
			
			redirect_to new_password_reset_path, notice: "Email not found"
		end
	end

	def edit
		  
	end

	def update
		 if params[:driver][:password].empty? 
			@driver.errors.add(:password, "can't be empty")
		    render 'edit'
		elsif @driver.update_attributes(driver_params)          # Case (4)
			driver_log_in @driver
			redirect_to @driver, notice: "Password has been reset"
		else
		render 'edit'                                     # Case (2)
		end
	end


	private

    def get_driver
      @driver = Driver.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_driver
    	@driver = Driver.find_by(email: params[:email])
      unless (@driver.authenticated?(:reset, params[:id]))      
        redirect_to root_url
      end
    end

	def driver_params
      params.require(:driver).permit(:password, :password_confirmation)
    end



    # Checks expiration of reset token.
	def check_expiration
	  if @driver.password_reset_expired?
	    redirect_to new_password_reset_url, notice: "Password reset has expired."
	  end
	end



end
