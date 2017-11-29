class AddAdminToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :admin, :boolean
  end
end
