require "rails_helper"

module WarehouseInteractions
  RSpec.describe AssignShipment do
    subject { AssignShipment.run(warehouse: warehouse, shipment_items: shipment_items) }

    let(:mattress) { create(:product, :mattress) }
    let(:warehouse) { create(:warehouse_with_product, product: mattress, quantity: 10) }

    context "when it has enough inventory to fulfill the shipment" do
      let(:shipment_items) { create_list(:shipment_item, 10, product: mattress) }

      it "returns a valid interaction result" do
        expect(subject.valid?).to be true
      end

      it "assigns the shipment to the warehouse" do
        subject
        expect(warehouse.shipments.count).to be 1
      end
    end
  end
end
