class CreateCruises < ActiveRecord::Migration[5.2]
  def change
    create_table :cruises do |t|
      t.string :name
      t.string :category
      t.integer :capacity
      t.integer :price_child
      t.integer :price_adult
      t.integer :min_age

      t.timestamps
    end
  end
end
