class AddMobileLoggedInToDriver < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :mobile_logged_in, :boolean
  end
end
