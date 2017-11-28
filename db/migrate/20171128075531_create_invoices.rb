class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :first_name
      t.string :last_name
      t.string :attachment

      t.timestamps
    end
  end
end
