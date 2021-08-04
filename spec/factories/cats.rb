FactoryBot.define do
  factory :cat do
    pet_name { Faker::Creature::Cat.name  }
    pet_color { Faker::Color.color_name }
    age { Faker::Number.number(digits: 1) }
  end
end
