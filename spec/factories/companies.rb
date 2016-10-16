FactoryGirl.define do
  factory :company do
    name "MyCompany"

    trait :single_warehouse do
      after(:create) do |company|
        create(:warehouse, company: company)
      end
    end

    trait :five_warehouses do
      after(:create) do |company|
        create_list(:warehouse, 5, company: company)
      end
    end
  end
end
