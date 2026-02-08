class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string  :name,  null: false
      t.text    :description
      t.decimal :price, null: false, precision: 10, scale: 2
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, :name
  end
end
