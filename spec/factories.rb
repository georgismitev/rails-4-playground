FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "product #{n}" }
    sequence(:price) { |p| (p % 10) + 1 }
  end

  factory :category do
    sequence(:name) { |n| "category #{n}" }
  end
end
