class Shipment < ApplicationRecord
  belongs_to :warehouse, optional: true
end
