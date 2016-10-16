class CreateInventoryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_items do |t|
      t.integer :quantity
      t.references :product, foreign_key: true
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
