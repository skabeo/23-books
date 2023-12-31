class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.references :user, null: false, foreign_key: { to_table: 'users' }, index: true
      t.string :name
      t.decimal :amount
      t.timestamps
    end
  end
end
