class AddMobileLoggedInToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :mobile_logged_in, :boolean
  end
end
