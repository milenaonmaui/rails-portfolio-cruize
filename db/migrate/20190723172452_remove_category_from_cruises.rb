class RemoveCategoryFromCruises < ActiveRecord::Migration[5.2]
  def change
    remove_column :cruises, :category, :string
  end
end
