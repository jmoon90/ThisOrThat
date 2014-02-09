FactoryGirl.define do
  factory :choice do
    choice1 'Pepsi'
    choice2 'Coke'
    association :status
  end
end
