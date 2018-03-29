class CreateQuotations < ActiveRecord::Migration[5.1]
  def change
    create_table :quotations do |t|
      t.boolean :approved
      t.string :attachment
      t.integer :driver_id

      t.timestamps
    end
  end
end
