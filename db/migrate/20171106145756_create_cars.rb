class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :vehicle_reg
 
      t.timestamps
    end
  end
end
