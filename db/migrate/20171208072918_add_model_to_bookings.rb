class AddModelToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :model, :string
  end
end
