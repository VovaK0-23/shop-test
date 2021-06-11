FactoryBot.define do
  factory :product do
    name { Faker::Lorem.characters(number: 6) }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end
