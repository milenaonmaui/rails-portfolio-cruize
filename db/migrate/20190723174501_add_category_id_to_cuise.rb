class AddCategoryIdToCuise < ActiveRecord::Migration[5.2]
  def change
    add_column :cruises, :category_id, :integer
  end
end
