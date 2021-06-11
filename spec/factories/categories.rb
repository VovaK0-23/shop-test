FactoryBot.define do
  factory :category do
    name { Faker::Lorem.characters(number: 6) }
    association :shop
  end
end
