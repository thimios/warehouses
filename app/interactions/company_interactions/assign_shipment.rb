module CompanyInteractions
  class AssignShipment < ActiveInteraction::Base
    object :company
    array :shipment_items

    def execute
      result = false
      company.warehouses.each do |warehouse|
        break if (result = try_assign(warehouse))
      end

      add_error unless result
    end

    private

    def add_error
      errors.add(:company, 'has no warehouse that can handle the shipment')
    end

    def try_assign(warehouse)
      WarehouseInteractions::AssignShipment.run(warehouse: warehouse, shipment_items: shipment_items).valid?
    end
  end
end
