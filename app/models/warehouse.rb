class Warehouse < ApplicationRecord
  belongs_to :company
  has_many :inventory_items
  has_many :shipments
  has_many :products, through: :inventory_items
end
