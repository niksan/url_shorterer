FactoryBot.define do
  factory :url do
    full { Faker::Internet.url }
    short { Faker::Lorem.characters[0..9] }
  end
end
