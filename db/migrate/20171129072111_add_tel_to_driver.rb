class AddTelToDriver < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :tel, :decimal
  end
end
