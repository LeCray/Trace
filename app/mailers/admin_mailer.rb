class AdminMailer < ApplicationMailer

	def account_activation(admin)
	    @admin = admin
	    admin.activation_token = Admin.new_token
	    mail to: admin.email, subject: "MAD Account Activation"
  	end
end
