class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :id_number

      t.timestamps
    end
  end
end
