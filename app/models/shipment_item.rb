class ShipmentItem < ApplicationRecord
  belongs_to :product
  belongs_to :shipment, optional: true
end
