# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "j#{n}@aol.com" }
    first_name 'j'
    last_name 'm'
    password 'password'
  end
end
