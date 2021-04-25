FactoryBot.define do
  factory :url_stat do
    association :url
    ip { Faker::Internet.ip_v4_address }
  end
end
