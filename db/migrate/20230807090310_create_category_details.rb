class CreateCategoryDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :category_details do |t|
      t.references :categories, null: false, foreign_key: {to_table: 'categories'}, index: true
      t.references :details, null: false, foreign_key: { to_table: 'details'}, index: true
      t.timestamps
    end
  end
end
