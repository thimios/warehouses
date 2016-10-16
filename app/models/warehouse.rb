class Warehouse < ApplicationRecord
  belongs_to :company
  has_many :inventory_items
  has_many :shipments
  has_many :products, through: :inventory_items

  def inventory_item(product)
    inventory_items.where(product: product).first
  end

  def quantity(product)
    inventory_item(product)&.quantity.to_i
  end
end
