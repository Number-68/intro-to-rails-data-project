class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :name
      t.string :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
