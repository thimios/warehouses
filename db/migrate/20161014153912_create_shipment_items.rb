class CreateShipmentItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shipment_items do |t|
      t.integer :quantity
      t.references :product, foreign_key: true
      t.references :shipment, foreign_key: true
      t.timestamps
    end
  end
end
