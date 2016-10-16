class AssignShipment < ActiveInteraction::Base
  object :company
  array :shipment_items

  def execute

  end
end
