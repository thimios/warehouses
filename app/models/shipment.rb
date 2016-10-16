class Shipment < ApplicationRecord
  belongs_to :warehouse, optional: true
  has_many :shipment_items
end
