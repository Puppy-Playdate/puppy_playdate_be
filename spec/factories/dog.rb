FactoryBot.define do
  factory :dog do
    name { Faker::FunnyName.name }
    breed { Faker::Creature::Dog.breed }
    age { Faker::Number.between(from: 1, to: 15) }
    size { Dog.sizes.values.sample }  
    neutered { Faker::Boolean.boolean }
  end
end