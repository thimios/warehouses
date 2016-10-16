require "rails_helper"

RSpec.describe AssignShipment do
  subject { AssignShipment.run(company: company, shipment_items: shipment_items) }

  context "for a company with only one warehouse" do
    let(:company) { create(:company, :single_warehouse) }

    context "when it has enough inventory to fulfill the  shipment" do
      let(:mattress) { create(:product, :mattress) }
      let(:shipment_items) { create_list(:shipment_item, 4, product: mattress) }

      it "returns a valid interaction result" do
        expect(subject.valid?).to be true
      end
    end
  end
end
