class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :cruises, :capacity, :seats_left
  end
end
