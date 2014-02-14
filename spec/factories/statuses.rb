FactoryGirl.define do
  factory :status do
    approved false
    pending true
    association :question
  end
end
