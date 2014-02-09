FactoryGirl.define do
  factory :choice do
    sequence(:choice1) { |n| "Pepsi#{n}" }
    sequence(:choice2) { |n| "Coke#{n}" }
    association :user
  end
end
