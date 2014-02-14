FactoryGirl.define do
  factory :question do
    description "What cleans better?"
    association :user
  end
end
