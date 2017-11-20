class AddActivatedAtToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :activated_at, :datetime
  end
end
