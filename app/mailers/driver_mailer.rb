	class DriverMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.driver_mailer.password_reset.subject
  #
	def password_reset(driver)
	    @driver = driver
	    mail to: driver.email, subject: "M.A.D Password Reset"
	end


end
