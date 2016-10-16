FactoryGirl.define do
  factory :warehouse do
    name { |n| "warehouse#{n}" }
    company

    factory :warehouse_with_product do
      transient do
        quantity 10
        product nil
      end

      after(:create) do |warehouse, evaluator|
        create(:inventory_item, warehouse: warehouse, product: evaluator.product, quantity: evaluator.quantity)
      end
    end
  end
end
