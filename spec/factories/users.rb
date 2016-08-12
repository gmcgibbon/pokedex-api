FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.email("#{first_name}_#{n}") }
    password         { '1' * 8 }
    first_name       { Faker::Name.first_name }
    last_name        { Faker::Name.last_name }
  end
end
