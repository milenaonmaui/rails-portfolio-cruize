class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :cruise_id
      t.integer :user_id
      t.integer :num_adults
      t.integer :num_children

      t.timestamps
    end
  end
end
