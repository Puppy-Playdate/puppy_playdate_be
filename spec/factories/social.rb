FactoryBot.define do
  factory :social do
    name { Faker::FunnyName.name }
    description { Faker::Quote.famous_last_words }
    event_date { Faker::Date.between(from: '2020-01-01', to: '2020-12-31') }
    event_type { Social.event_types.values.sample }
    location { Faker::Address.full_address }
  end
end