class AddStatusToQuotations < ActiveRecord::Migration[5.1]
  def change
    add_column :quotations, :status, :string
  end
end