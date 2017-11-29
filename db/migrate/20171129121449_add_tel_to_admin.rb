class AddTelToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :tel, :decimal
  end
end
