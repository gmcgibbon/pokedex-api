FactoryGirl.define do
  factory :pokemon do
    name  { Faker::Pokemon.name }
    image { test_image }
  end
end
