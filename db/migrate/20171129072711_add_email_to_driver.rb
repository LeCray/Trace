class AddEmailToDriver < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :email, :string
  end
end
