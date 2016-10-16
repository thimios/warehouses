FactoryGirl.define do
  factory :shipment_item do
    quantity 10
    product
    shipment
  end
end
