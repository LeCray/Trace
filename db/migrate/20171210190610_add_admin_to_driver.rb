class AddAdminToDriver < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :admin, :boolean
  end
end
