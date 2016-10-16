require "rails_helper"

module WarehouseInteractions
  RSpec.describe AssignShipment do
    subject { AssignShipment.run(warehouse: warehouse, shipment_items: shipment_items) }

    let(:mattress) { create(:product, :mattress) }
    let(:inventory_quantity) { 10 }
    let(:warehouse) { create(:warehouse_with_product, product: mattress, quantity: inventory_quantity) }

    context "when it has enough inventory to fulfill the shipment" do
      let(:shipment_items) { create_list(:shipment_item, 1, product: mattress, quantity: inventory_quantity) }

      it "returns a valid interaction result" do
        expect(subject.valid?).to be true
      end

      it "assigns the shipment to the warehouse" do
        subject
        expect(warehouse.shipments.count).to be 1
      end
    end

    context "when it does not have enough inventory to fulfill the shipment" do
      let(:shipment_items) { create_list(:shipment_item, 1, product: mattress, quantity: inventory_quantity + 1) }

      it "returns an invalid interaction result" do
        expect(subject.valid?).to be false
      end

      it "does not assign the shipment to the warehouse" do
        subject
        expect(warehouse.shipments.count).to be 0
      end
    end

  end
end
