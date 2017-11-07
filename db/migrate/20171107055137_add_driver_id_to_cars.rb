class AddDriverIdToCars < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :driver_id, :integer
  end
end
