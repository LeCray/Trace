class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :admin_id
      t.integer :driver_id

      t.timestamps
    end
  end
end
