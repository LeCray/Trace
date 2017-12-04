class AdminMailer < ApplicationMailer

	def account_activation(admin)
	    @admin = admin
	    mail to: admin.email, subject: "MAD Account Activation"
  	end

  	def admin_password_reset(driver)
	    @admin = admin
	    mail to: admin.email, subject: "Password reset"
	end

	
end
