# Preview all emails at http://localhost:3000/rails/mailers/driver_mailer
class DriverMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/driver_mailer/password_reset
  def password_reset
    driver = Driver.first
    driver.reset_token = Driver.new_token
    DriverMailer.password_reset(driver)
  end

end
