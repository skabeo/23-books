class RenameColumnsInCategoryDetails < ActiveRecord::Migration[7.0]
  def change
    rename_column :category_details, :categories_id, :category_id
    rename_column :category_details, :details_id, :detail_id
  end
end
