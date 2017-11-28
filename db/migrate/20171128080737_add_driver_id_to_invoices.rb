class AddDriverIdToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :driver_id, :integer
  end
end
