FactoryGirl.define do
  factory :product do
    name "MyProduct"

    trait :mattress do
      name "Mattress"
    end

    trait :pilow do
      name "Pilow"
    end
  end
end
