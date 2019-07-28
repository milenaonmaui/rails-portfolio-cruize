class ChangeNumChildrenDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :num_children, :integer, :default => 0
  end
end
