class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :time
      t.string :description

      t.timestamps
    end
  end
end
