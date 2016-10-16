class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.string :recipient_address
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
