# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview
  
  # Preview this email at
  # http://localhost:3000/rails/mailers/admin_mailer/account_activation
  def account_activation
    admin = Admin.last
    admin.activation_token = Admin.new_token
    AdminMailer.account_activation(admin)
  end

end
