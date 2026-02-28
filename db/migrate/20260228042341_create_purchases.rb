class CreatePurchases < ActiveRecord::Migration[7.2]
  def change
    create_table :purchases do |t|
      t.references :customer, null: false, foreign_key: true
      t.datetime :date
      t.float :total_price

      t.timestamps
    end
  end
end
