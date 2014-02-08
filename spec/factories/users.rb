# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'j@aol.com'
    first_name 'j'
    last_name 'm'
    password 'password'
  end
end
