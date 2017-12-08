class AddMakeToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :make, :string
  end
end
