FactoryGirl.define do
  factory :pokemon do
    name  { Faker::Pokemon.name }
    image { File.open Rails.root.join *%w(spec data image.png) }
  end
end
