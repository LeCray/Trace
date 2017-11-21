class AdminMailer < ApplicationMailer

	def account_activation(admin)
	    @admin = admin
	    mail to: admin.email, subject: "MAD Account Activation"
  	end
end
