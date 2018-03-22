class AddFcmTokenToDriver < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :fcm_token, :string
  end
end
