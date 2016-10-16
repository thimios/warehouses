module WarehouseInteractions
  class AssignShipment < ActiveInteraction::Base
    object :warehouse
    array :shipment_items

    def execute
      if shipment_possible?
        warehouse.shipments.create(shipment_items: shipment_items)
      else
        errors.add(:warehouse, 'does not have enough inventory to fulfill the shipment')
      end
    end

    private

    def shipment_possible?
      shipment_items.inject(true) { |result, n| result && shipment_item_possible?(n) }
    end

    def shipment_item_possible?(shipment_item)
      warehouse.quantity(shipment_item.product) >= shipment_item.quantity
    end
  end
end
