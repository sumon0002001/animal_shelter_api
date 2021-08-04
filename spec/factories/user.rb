FactoryBot.define do
  factory :user do
    username { Faker::Games::StreetFighter.character  }
  end
end