require "rails_helper"

module CompanyInteractions
  RSpec.describe AssignShipment do
    subject { AssignShipment.run(company: company, shipment_items: shipment_items) }

    let(:company) { create(:company, warehouses: [warehouse]) }
    let(:mattress) { create(:product, :mattress) }
    let(:warehouse) { create(:warehouse_with_product, product: mattress, quantity: inventory_quantity) }
    let(:inventory_quantity) { 10 }

    context "for a company with only one warehouse" do
      context "when it has enough inventory to fulfill the shipment" do
        let(:shipment_items) { create_list(:shipment_item, 1, quantity: inventory_quantity, product: mattress) }

        it "returns a valid interaction result" do
          expect(subject.valid?).to be true
        end

        it "assigns the shipment to the warehouse" do
          subject
          expect(warehouse.shipments.count).to be 1
        end
      end
    end

    context "when it does not have enough inventory to fulfill the shipment" do
      let(:shipment_items) { create_list(:shipment_item, 1, quantity: inventory_quantity + 1, product: mattress) }

      it "returns a valid interaction result" do
        expect(subject.valid?).to be false
      end

      it "assigns the shipment to the warehouse" do
        subject
        expect(warehouse.shipments.count).to be 0
      end
    end
  end
end
