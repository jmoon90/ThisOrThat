FactoryGirl.define do
  factory :option do
    description "Coke" 
    association :question
  end
end
