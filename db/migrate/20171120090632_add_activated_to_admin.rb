class AddActivatedToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :activated, :boolean
  end
end
