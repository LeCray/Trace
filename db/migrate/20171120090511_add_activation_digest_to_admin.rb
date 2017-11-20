class AddActivationDigestToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :activation_digest, :string
  end
end
